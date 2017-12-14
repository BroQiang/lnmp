
# 查看操作系统版本信息
systemVersion=${systemVersion:-$(uname -r | awk -F'.' '{print $4}')}

case $systemVersion in 
    "el7" | "rhel7" | "RHEL7" | "CentOS7" | "centos7" )
        fnSuccess "Your System version is RHEL7 or CentOS7"
        version="el7"
        ;;
    * )
        fnWarning "The system does not recognize, if the installation continues to run in the manner of RHEL7"

        # 下面两行是临时使用，暂时没有写其他版本，只能支持 CentOS7
        fnWarning "现在只支持 CentOS7，脚本退出"
        exit 1
        #fnWarning "你也可以通过执行 export systemVersion rhel7 ，然后在执行脚本"
        while [[ "${yn}" != "yes" ]]
        do
            read -p "Please input [ yes | no ] :" yn
            case $yn in
                "yes" )
                    fnWarning "The script will run as RHEL7"
                    version="el7"
                    ;;
                "no" )
                    fnError "\nNot installed, has been manually quit\n"
                    exit 1
                    ;;
                * )
                    fnError "\nInvalid parameter input !!"
                    ;;
                esac
        done
        ;;
esac
