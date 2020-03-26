
VERSION=0.27.0
FILENAME=bazel-$VERSION-installer-linux-x86_64.sh
wget https://github.com/bazelbuild/bazel/releases/download/$VERSION/$FILENAME
bash $FILENAME
rm $FILENAME
