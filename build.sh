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

echo Build CSS
# use default filesystem ordering as poormans CSS load order.  WOW.
cat $SRC_DIR/*.css > $BUILD_DIR/skilltree.css
echo ----------------------------

echo Build HTML
cp -vp $SRC_DIR/*.html $BUILD_DIR
echo ----------------------------

echo Build TEST HARNESS
cat $SRC_WRAPPER_HEADER $SRC_HTML $SRC_WRAPPER_FOOTER > $BUILD_DIR/index.html
echo ----------------------------

echo BUILD SUCCESS???