currentdir=`pwd`
echo $currentdir
mv ~/.vimrc ~/.vimrc_bak_xunvim
mv ~/.vim ~/.vim_bak_xunvim

ln -s $currentdir/vimrc ~/.vimrc
ln -s $currentdir/vim ~/.vim
