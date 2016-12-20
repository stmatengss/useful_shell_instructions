mkdir -p ~/.vim/{ftdetect,indent,syntax}
for d in ftdetect indent syntax
do wget --no-check-certificate -O ~/.vim/$d/scala.vim \
    https://raw.githubusercontent.com/derekwyatt/vim-scala/master/$d/scala.vim;
done

# highlight scala-lang
