BUILD_VERSION   := v1.1.1
BUILD_TIME      := $(shell date "+%F %T")
BUILD_NAME      := app_$(shell date "+%Y%m%d%H" )
SOURCE          := goversion.go
TARGET_DIR      := ./
GO_VERSION     := $(shell git rev-parse HEAD )

all:
	# CGO_ENABLED=0 GOOS=linux GOARCH=amd64
	go build -ldflags  \
	"                  \
	-X 'main.VERSION=${BUILD_VERSION}' \
	-X 'main.BUILD_TIME=${BUILD_TIME}' \
	-X 'main.BuildName=${BUILD_NAME}'  \
	-X 'main.GO_VERSION=${GO_VERSION}' \
	"                                  \
    -o ${BUILD_NAME} ${SOURCE}

clean:
	rm ${BUILD_NAME} -f

install:
	mkdir -p ${TARGET_DIR}
	cp ${BUILD_NAME} ${TARGET_DIR} -f

.PHONY : all clean install ${BUILD_NAME}
