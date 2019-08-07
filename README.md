
# 설정

###필요 프로그램

- `~/.aws` 에 `hoian_alpha`, `hoian_packer` 프로필에 대한 key 설정이 되어 있어야됨
- `ansible==2.6.4.0` ansible@2.6.4.0 버전이 설치되어 있어야 함
- `packer`: packer ansible, vagrant로 EC2에서 원하는 대로 노드가 만들어지면 그 노드를 이미지로 만드는 작업


#### ansible install

``` bash
pip3 install ansible==2.6.4.0
```

#### packer install

``` bash
brew install packer
```

# AMI 이미지 만들기

`aws_access_key`, `aws_secret_key`는 packer 전용으로 발급된것이 있음


``` bash
# name = [elasticsearch]
#                 검색
packer build packer/${name}.json
```


vagrant는 다음 환경변수를 이용한다.

``` bash
AWS_REGION=             # AWS 리전
AWS_ACCESS_KEY_ID=      # AWS 인증 정보
AWS_SECRET_ACCESS_KEY=  # AWS 인증 정보
```
