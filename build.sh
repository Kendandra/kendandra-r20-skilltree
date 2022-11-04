BUILD_DIR="./build"
SRC_DIR="./src"
SRC_HTML="$SRC_DIR/skilltree.html"
SRC_WRAPPER_HEADER="wrapper_header.html"
SRC_WRAPPER_FOOTER="wrapper_footer.html"

echo Really dumb build script 1.0
echo ============================
echo Build dest: $BUILD_DIR
echo Source:     $SRC_DIR
echo ============================

echo Clearing build cache
rm -v $BUILD_DIR/*
echo ----------------------------

echo Build css
# use default filesystem ordering as poormans CSS load order.  WOW.
cat $SRC_DIR/*.css > $BUILD_DIR/skilltree.css
echo ----------------------------

echo Build copy
# move all basic assets
cp -vp $SRC_DIR/*.html $BUILD_DIR
#cp -vp $SRC_DIR/*.css $BUILD_DIR
echo ----------------------------


echo Wrapper replacement
# build wrapper (crazy, I know)
#sed -r '/\{\{REPLACEMET\}\}/e cat $SRC_HTML' ./$SRC_WRAPPER > $BUILD_DIR/$SRC_WRAPPER

#sed -i "/REPLACEMET/r $SRC_WRAPPER" -e //N $SRC_HTML > $BUILD_DIR/$SRC_WRAPPER

cat $SRC_WRAPPER_HEADER $SRC_HTML $SRC_WRAPPER_FOOTER > $BUILD_DIR/index.html

echo ----------------------------

echo BUILD SUCCESS???