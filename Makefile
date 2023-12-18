
install_vimrc:
	ln -s `pwd`/.vimrc ~/.vimrc && ln -s `pwd`/.vim ~/.vim

add_plugin:
	vim +PluginInstall

update_plugin:
	vim +BundleUpdate

list_plugin:
	vim +BundleList

clean_plugin:
	vim +BundleClean
