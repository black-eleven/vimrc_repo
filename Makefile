
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
	cd ~/.vim/bundle/Plugins/YouCompleteMe && git submodule update --init --recursive && /usr/local/bin/python3 install.py --clangd-completer --go-completer --verbose

# 因为ycm不支持python3.8以下的版本
reinstall_python:
	brew install --build-from-source python@3.12

# mac原始的vim没有编译python
reintsall_vim:
	brew install macvim

# 编译ycm的时候需要用
install_cmake:
	brew install cmake

# 编译的时候需要用到
update_setuptools:
	/usr/local/bin/pip3 install setuptools --break-system-packages
