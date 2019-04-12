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

- 构件镜像

```bash
docker build -t laravel-local -f Dockerfile.local .
```

- 删除容器

```bash
docker rm -f laravel-local
```

- 运行容器

```bash
docker run -d --name laravel-local -p 8321:80 -v $(pwd):/data laravel-local:latest \
    && docker logs -f laravel-local
```

> Tips: 当终端输出 'Now, you can use Ctrl+C to continue!' 时，可以使用Ctrl+C停止查看日志

- 进入容器

```bash
docker exec -it laravel-local sh
```
