# customized alpine docker image

This doker image contains latest image of alpine and install on it: wget,curl,openssl,java-jdk1.8u251,ca-certificates,wget,fonts(ttf-dejavu,fontconfig).

### Build

```bash
docker build --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
             --build-arg VCS_URL="https://github.com/hamidgholami/customizedalpine.git" \
	     --build-arg VCS_REF=$(git show HEAD~0 --pretty=format:"%h" --no-patch) \
	     -t hamidgholami/alpine:jdk1.8u251 .
```
