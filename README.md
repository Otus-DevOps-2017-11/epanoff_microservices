# Homework-31
* Установил Helm - пакетный менеджер для Kubernetes.
* Установил серверную часть Helm’а - Tiller.
* Создал Chart для компонентов приложения 
* Создал Chart общий
* Установил Gitlab на kubernetes кластере на основе omnibus
* Настроил ci/cid
*
* Задание со звездочкой не делал. 



# Homework-30

* Настроили публикацию ui через NodePort 
* Настроили публикацию ui через LoadBalancer
* Создал ui-ingress.yml
* Настроил шифрование tls
* Задание со * Описал создаваемый объект Secret в виде Kubernetes- манифеста - docker/kubernates/Kube/secret-ui-ingress.yml 
* Настроил mongo-network-policy.yml 
* Настроил динамический Persistance Volume для MongoDb 

# homework - 29

* Установил minikube c virtualbox в качестве бекенда
* Стартовал minikube
* Изучил ~/.kube/config - minukube создает контекст
* Запустил ui-deployment.yml post-deployment.yml comment-deployment.yml mongo-deployment.yml  
* Запустил соотвествующие сервисы
* Запустил дашборд kubernates в minikube
* Настроил dev namespace 
* Развернул kubernates в гугле
* Запустил отработанные деплои  в гугле 
* Запустил дашборд
* Сделал все задания со звездочкой


# homework - 21

* Подготовил окружение prometheus. (Полюбившийся нам реддит + prometheus) Все при помощи  docker-machine и compose
* Создал контейнер с prometheus
* Поизучал ui и графике в прометеусе
* Поузучал хелсчеки в прометеусе на примере графика ui_health
* Создал node-exporter
* Задания со звездочкой сделал все mongodb, blackbox и Makefile который умеет билдить и пушить  blackbox вдохновлялся
https://medium.com/the-telegraph-engineering/how-prometheus-and-the-blackbox-exporter-makes-monitoring-microservice-endpoints-easy-and-free-of-a986078912ee
mongodb exporter брал отсюда https://github.com/percona/mongodb_exporter


# homework - 20

* Создал новый проект
* Покдлючил к нему раннер с проекта прошлого задания.
* Добавил в паплайн дев окружение
* В проекте появился новый env
* Добавил staging и prod
* Сначала stagin и prod накатывались вручную потом по тагу
only:
    - /^\d+\.\d+.\d+/
    
* Задания со звездочками не одолел. 

# homework - 19

* Развернул через terraform и ansible новый хост
* Скопировал docker-compose файл
* Запустил dokcer-compose
* В гитлабе создал проект
* Создал pipeline 
* Запустил runner
* Добавил  тестирование reddit в pipeline
* Настроил публикацию в слак
* Почитал про Runners autoscale configuration и Autoscaling GitLab Runner on AWS


# homework-17

* Запускал контейнер в none сети. Есть только loopback интефейс
* Запускал контйенер в host сети. Вывод ifconfig не отличается от вывода ifconfig хосты машины
* Когда несколько раз запускаешь docker run --network host -d nginx то в живых остается только первый контейнер, так как он один успевает занять 80 порт на хосте.
* Запускал контейнеры в созданной сети reddit  без алиасов (приложение не работает)  с алисами - работает.
* Запускал контйейнеры в разных двух сетях где ui не может достучаться до бд
* Рассмотрел выводы iptables, brctl show, docker network ls
* Чтобы поменять префикс нужно добавить в .env COMPOSE_PROJECT_NAME=name либо запускать через  -p name
* Создал docker-compose.override.yml в котором переопределил монторивание и запуск
docker-compose -f docker-compose.yml -f docker-compose.override.yml up

# homework-16

* Перенес старые домашки в docker-monolith
* Создал папку reddit-microservices
* Скопировал в нее файлы приложений
* Создал Докерфайлы для разных приложений из примера
* Подшамашнил их чтобы линтер не жаловался. (ADD => COPY, удалиние хвостов, описание версий пакетов, неустановка лишних пакетов)
* Собрал имеджи
* UI имеет одинаковое начало с comment поэтому было сэкономлено несколько этапов.
* Запустил контейнеры - работает!!!
* Задание со свездочкой - работает!!! Нужно в docker run которые из задания
изменить алиас --network-alias=post_db1 и в соотвественно docker run
-e POST_DATABASE_HOST=post_db1
* Сделал образ ui на alpine 
*  ** Пробовал уменьшить образ. --virtual build-dependencies особого эффекта не дало. 
Слепил несколько слоев - тоже без особого эффекта.  Почитал что можно включить эксперементальный режим и запустить build --squash
Раз эксперементально, то не стал заморачиваться. 
Плюс еще сделал http://tuhrig.de/flatten-a-docker-container-or-image/ так назывемый flatten - образ стал очень маленький 56 мб но при этом не рабочий

Итого - 213 Мб - рабочий образ, 56 нерабочий  с ошибкой ERROR: No application configured, nothing to run

* Сделал volume - перезапустил - работает!!!

# homework-15

* Создал новый проект на GCP
* При помощи docker-machine создал новый хост
* По сравнивал различные namespace при запуске
с --pid host (видны процессы хоста) и без (видны только процессы докера)
* Создал скрипты и конфиги  
* Создал докер файл из базового образа ubuntu:16.04
* В нем установка mongo ruby, установка конфигов и сборка проекта.
* Собраз образ
* Запустил контейнер на основе него в сети хоста
* Добавил правило файервола
* Залил образ на докерхаб



# homework-14

* Установил докер docker
* Запускал hello-world  контейнер
* Запускал несколько ubuntu контейнеров 
* Аттачился к контейнеру docker attach
* Запускал новый процесс внутри контейнера docker exec
* Сохранил image работающего контейнера
* Вывел информацию о образах в docker-1.log
* Убил запущенный контейнер
* Удалил все контейнеры и образы
