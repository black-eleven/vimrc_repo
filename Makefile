
install_vimrc:
	ln -s `pwd`/.vimrc ~/.vimrc && ln -s `pwd`/.vim ~/.vim && git submodule init && git submodule update

add_plugin:
	vim +PluginInstall

update_plugin:
	vim +BundleUpdate

list_plugin:
	vim +BundleList

clean_plugin:
	vim +BundleClean
