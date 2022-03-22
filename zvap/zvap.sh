#!/bin/sh
#kamon


cache="/home/$USER/zv_cache";
defp="/home/$USER";
program=$1;


if [ -z $program ];then
	printf "zvap <program name>\n";
	exit;
fi;

echo "y" > y.txt;
mkdir $cache;

cd $cache;
git clone https://aur.archlinux.org/$program.git;
cd $program;


makepkg -si;

printf "you want delete $program cache from zv_cache?\n";
read del;


if [ $del == "yes" ];then
	printf "deleting the $program cache from zv_cache.\n";
	cd $cache;
	rm --force -r $program;
	cd $defp;
	rm $defp/y.txt -fr;
	printf "done its deleted successfully.\n";
	exit 0;
elif [ $del == "no" ];then
	printf "okay.\n";
	printf "skiping from deleting $program cache from zv_cache.\n";
	exit 0;
fi;

# kamon
