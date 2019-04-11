## awesome-laravel-api

#### Composer 镜像加速

- 全局配置laravel-composer

```bash
composer config -g repo.packagist composer https://packagist.laravel-china.org
```

- 在运行

```bash
composer install
```

#### Docker 环境搭建

```bash
docker build -t laravel -f Dockerfile.local .
```

```bash
docker run -d --name laravel -p 8321:80 -v $(pwd):/data laravel:latest
```

```bash
docker exec -it laravel sh
```
