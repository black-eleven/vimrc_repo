
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

reinstall_vim:
	brew install cmake macvim python

install_ycm: add_plugin
	cd ~/.vim/bundle/Plugins/YouCompleteMe && git submodule update --init --recursive && python3 install.py --clangd-completer --go-completer

