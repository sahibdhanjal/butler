# install proto-compiler
VERSION=3.6.1
PROTOC_ZIP=protoc-$VERSION-linux-x86_64.zip
curl -OL https://github.com/protocolbuffers/protobuf/releases/download/v$VERSION/$PROTOC_ZIP
unzip -o $PROTOC_ZIP -d /usr/local bin/protoc
unzip -o $PROTOC_ZIP -d /usr/local 'include/*'
rm -f $PROTOC_ZIP
# install zlib1g-dev
curl -OL http://security.ubuntu.com/ubuntu/pool/main/z/zlib/zlib1g-dev_1.2.11.dfsg-0ubuntu2_amd64.deb
dpkg -i zlib1g-dev_1.2.11.dfsg-0ubuntu2_amd64.deb
# install libprotobuf-lite
LIBPROTOBUF_LITE=libprotobuf-lite17_3.6.1.3-2_amd64.deb
curl -OL http://security.ubuntu.com/ubuntu/pool/main/p/protobuf/$LIBPROTOBUF_LITE
dpkg -i $LIBPROTOBUF_LITE
# install libprotobuf
LIBPROTOBUF=libprotobuf17_3.6.1.3-2_amd64.deb
curl -OL http://security.ubuntu.com/ubuntu/pool/main/p/protobuf/$LIBPROTOBUF
dpkg -i $LIBPROTOBUF
# install libproto-dev
LIBPROTO_DEV=libprotobuf-dev_3.6.1.3-2_amd64.deb
curl -OL http://security.ubuntu.com/ubuntu/pool/main/p/protobuf/$LIBPROTO_DEV
dpkg -i $LIBPROTO_DEV
# install libproto-compiler
LIBPROTOBUF_COMPILER=libprotoc17_3.6.1.3-2_amd64.deb
curl -OL http://security.ubuntu.com/ubuntu/pool/main/p/protobuf/$LIBPROTOBUF_COMPILER
dpkg -i $LIBPROTOBUF_COMPILER
