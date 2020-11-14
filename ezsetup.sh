#!/bin/bash
#fonts color
Green="\033[32m"
Red="\033[31m"
#Yellow="\033[33m"
GreenBG="\033[42;37m"
RedBG="\033[41;37m"
YellowBG="\033[43;37m"
Font="\033[0m"
#notification information
# Info="${Green}[信息]${Font}"
OK="${Green}[OK]${Font}"
Error="${Red}[错误]${Font}"
Warning="${Red}[警告]${Font}"

source /etc/os-release

    if [[ "${ID}" == "centos" && ${VERSION_ID} -ge 7 ]]; then
        echo -e "${GreenBG} 当前系统为 Centos ${VERSION_ID} ${VERSION} ${Font}"
        INS="yum"
    elif [[ "${ID}" == "debian" && ${VERSION_ID} -ge 8 ]]; then
        echo -e "${GreenBG} 当前系统为 Debian ${VERSION_ID} ${VERSION} ${Font}"
        INS="apt"
        $INS update -y
        ## 添加 Nginx apt源
    elif [[ "${ID}" == "ubuntu" && $(echo "${VERSION_ID}" | cut -d '.' -f1) -ge 16 ]]; then
        echo -e "${GreenBG} 当前系统为 Ubuntu ${VERSION_ID} ${UBUNTU_CODENAME} ${Font}"
        INS="apt"
        $INS update -y
    else
        echo -e "${Error} ${RedBG} 当前系统为 ${ID} ${VERSION_ID} 不在支持的系统列表内，安装中断 ${Font}"
        exit 1
    fi


${INS} install curl vim -y


    echo -e "\t ${Green}MP脚本整合${Font}"
    echo -e "\t---Combined by Mark---"
    echo -e "\thttps://github.com/MarkPetrol"

    echo -e "${Green}1.${Font}  使用最新BBr脚本"
    echo -e "${Green}2.${Font}  使用冷门暴力BBr脚本（仅Debian系可用）"
	echo -e "${Green}3.${Font}  使用国内源BBr脚本"
    echo -e "${Green}4.${Font}  AutoReinstall DD脚本"
    echo -e "${Green}5.${Font}  OneDrive源DD脚本"
    echo -e "${Green}6.${Font}  GoogleDrive源DD脚本"
    echo -e "${Green}7.${Font}  修改DNS"
	echo -e "${Green}8.${Font}  修改密钥登陆"
    echo -e "${Green}9.${Font}  探针服务端"
    echo -e "${Green}10.${Font} 探针客户端"
    echo -e "${Green}11.${Font} 安装 MTProxy(TLS)"
    echo -e "${Green}12.${Font} 添加Swap（@萌鼠）"
    echo -e "${Green}13.${Font} 添加Swap（上面用不了再用这个）"
	echo -e "${Green}14.${Font} 一键安装Docker测试版"
    echo -e "${Green}15.${Font} SuperBench"
    echo -e "${Green}16.${Font} LemonBench"
    echo -e "${Green}17.${Font} 回程路由"
	echo -e "${Green}18.${Font} 回程路由(nanqinlang)"
    echo -e "${Green}19.${Font} 安装wulabing V2脚本"
	echo -e "${Green}20.${Font} 重启V2"
	echo -e "${Green}21.${Font} 重启Nginx"
	echo -e "${Green}22.${Font} 安装Trojan脚本"
	echo -e "${Green}23.${Font} 安装iptables转发（natcfg）"

    sleep 1
	read -rp "请输入数字：" menu_num
    case $menu_num in
    1)
        wget -N --no-check-certificate "https://searchforyou.me/tcp.sh" && chmod +x tcp.sh && ./tcp.sh
        ;;
    2)
        bash <(wget --no-check-certificate -qO- 'https://raw.githubusercontent.com/caippx/bash/master/vvr/vvr.bash')
        ;;
    3)
        wget "https://dt.yixiagege.cn/shell/tcp-cn.sh" && chmod +x tcp-cn.sh && ./tcp-cn.sh
        ;;
    4)
        wget --no-check-certificate -O AutoReinstall.sh https://git.io/AutoReinstall.sh && bash AutoReinstall.sh
        ;;
    5)
        wget -N --no-check-certificate https://raw.githubusercontent.com/veip007/dd/master/dd-od.sh && chmod +x dd-od.sh && ./dd-od.sh
        ;;
    6)
        wget -N --no-check-certificate https://raw.githubusercontent.com/veip007/dd/master/dd-gd.sh && chmod +x dd-gd.sh && ./dd-gd.sh
        ;;
    7)
        wget -qO- https://get.docker.com/ | bash
        ;;
    8)
        vim /etc/resolv.conf
        ;;
    9)
        bash <(curl -Lso- https://searchforyou.me/rsa.sh)
        ;;
    10)
        wget https://raw.githubusercontent.com/CokeMine/ServerStatus-Hotaru/master/status.sh && bash status.sh s
        ;;
    11)
        wget https://raw.githubusercontent.com/CokeMine/ServerStatus-Hotaru/master/status.sh && bash status.sh c
        ;;
    12)
        wget https://searchforyou.me/mtproxy.sh && bash mtproxy.sh
        ;;
    13)
        wget https://www.moerats.com/usr/shell/swap.sh && bash swap.sh
        ;;
    14)
        wget -qO- --no-check-certificate https://searchforyou.me/addswap.sh | bash
        ;;
    15)
        wget -qO- https://raw.githubusercontent.com/oooldking/script/master/superbench.sh | bash
        ;;
    16)
        curl -fsL https://ilemonra.in/LemonBenchIntl | bash -s fast
        ;;
    17)
        wget -qO- git.io/besttrace | bash
        ;;
	18)
        wget https://raw.githubusercontent.com/nanqinlang-script/testrace/master/testrace.sh && bash testrace.sh
        ;;
	19)
        bash <(curl -L -s https://raw.githubusercontent.com/wulabing/V2Ray_ws-tls_bash_onekey/master/install.sh) | tee v2ray_ins.log
        ;;
	20)
        systemctl restart v2ray
        ;;
	21)
        systemctl restart nginx
        ;;
	22)
        bash <(curl -s -L https://github.com/V2RaySSR/Trojan/raw/master/Trojan.sh)
        ;;
	23)
        wget -qO natcfg.sh https://searchforyou.me/natcfg.sh && bash natcfg.sh
        ;;
    *)
        echo -e "${RedBG}请输入正确的数字${Font}"
        ;;
    esac