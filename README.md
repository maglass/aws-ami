
# 설정

### 1. 필요 프로그램

- `~/.aws` 에 `hoian_alpha`, `hoian_packer` 프로필에 대한 key 설정이 되어 있어야됨
- `ansible==2.6.4.0` ansible@2.6.4.0 버전이 설치되어 있어야 함
- `vagrant`: packer로 ami를 만들기 전에 EC2로 부터 ansible의 내용이 잘 작동하는지 까지 체크하기 위함
- `packer`: packer ansible, vagrant로 EC2에서 원하는 대로 노드가 만들어지면 그 노드를 이미지로 만드는 작업


#### ansible install

``` bash
pip3 install ansible==2.6.4.0
```

#### packer install

``` bash
brew install packer
```

#### vagrant install

``` bash
brew install Caskroom/cask/vagrant ansible
vagrant plugin install vagrant-aws
vagrant box add dummy https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box
```

# AMI 이미지 만들기

`aws_access_key`, `aws_secret_key`는 packer 전용으로 발급된것이 있음


``` bash
# name = [elasticsearch]
#                 검색
packer build packer/${name}.json
```

# AMI 이미지 만들기 - 테스트

### vagrant

- AMI를 바로 만드는게 아니라 ec2에를 올리고 올라간 ec2에다가 ansible의 내용을 직접 수행하여 provisioning을 한다.
- Packer 빌드 전에 같은 환경에서 Vagrant로 테스트해볼 수 있다. 현재는 web만 설정되어있음.
- 먼저 macOS 기준 다음 패키지들을 설치해야한다.

### vagrant 자주 사용하는 명령어
``` bash
# name = [elasticsearch]
#              검색
vagrant up $name
vagrant provision $name --no-provision
vagrant destroy $name
```

vagrant는 다음 환경변수를 이용한다.

``` bash
AWS_REGION=             # AWS 리전
AWS_ACCESS_KEY_ID=      # AWS 인증 정보
AWS_SECRET_ACCESS_KEY=  # AWS 인증 정보
VAGRANT_AWS_KEY_PAIR=   # AWS에 등록되어있는 키페어 이름(SSH 접속에 사용)
VAGRANT_SSH_KEY_PATH=   # SSH 접속에 사용할 파일
```
