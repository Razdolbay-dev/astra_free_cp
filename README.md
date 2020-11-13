## Astra Free Control Panel | Django
Django используется только для отображения информации по битрейту и сигналу тюнеров.
Решил построить проект потому что на просторах инета не нашел решения мониторинга free версии ( т.е. 4.4.182)
### Для получения данных с сервера используется Mysql и PHP скрипт
# Установка
```
sudo apt-get update 
sudo apt-get install python3-pip apache2 libapache2-mod-wsgi-py3
sudo pip3 install virtualenv 
sudo apt install php libapache2-mod-php php-mysql mysql-server apache2 default-libmysqlclient-dev
```
Я поместил все в ``/etc/astra/web``

в app/settings.py меняем строчки на свои

```DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql', 
        'NAME': 'DB_NAME',
        'USER': 'DB_USER',
        'PASSWORD': 'DB_PASSWD',
        'HOST': 'localhost',   # Or an IP Address that your DB is hosted on
        'PORT': '3306',
    }
```
### Папку HTML переносим в любое удобное место
переходим например ``cd /etc/astra/web``. 
Юзаем команду ``virtualenv env & . env/bin/activate``

```
pip3 install -r requirements.txt
python3 manage.py makemigrations
python3 manage.py migrate
```
