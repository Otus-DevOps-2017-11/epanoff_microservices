
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

# homework - 28

* Созданы файлы 

docker/kubernetes/comment-deployment.yml
docker/kubernetes/mongo-deployment.yml
docker/kubernetes/post-deployment.yml
docker/kubernetes/ui-deployment.yml

* Создана папка docker/kubernetes/kubernetes_the_hard_way
* Пройден туториал https://github.com/kelseyhightower/kubernetes-the-hard-way
* Все артефакты которые появились в ходе туториала сохранены в папке docker/kubernetes/kubernetes_the_hard_way
```
epanov:kubernetes epanov$ kubectl get pods
NAME                                  READY     STATUS    RESTARTS   AGE
comment-deployment-679b694457-dzd88   1/1       Running   0          14m
mongo-deployment-6897d74d54-c99bk     1/1       Running   0          1m
post-deployment-65b7f5fdbc-5v8dk      1/1       Running   0          4m
ui-deployment-7ffd7dbf9f-5m567        1/1       Running   0          4m
epanov:kubernetes epanov$
```
* Кластер уничтожен
* Задание со звездочкой поленился сделать. 

# homework - 27

* Построение кластера Docker Swarm
* Конфигурирование приложения в Docker swarm в compose файлах
* Создал воркеры и мастер
```
docker-machine create --driver google    --google-project  docker-shmoker     --google-zone europe-west1-b    --google-machine-type g1-small    --google-machine-image $(gcloud compute images list --filter ubuntu-1604-lts --uri)    worker-3
```
* Проинизиализировал кластер и присоеденил ноды
```
sudo docker swarm init
sudo docker swarm join --token token-moken 10.132.0.2:2377
```
* Деплоил приложение 
```
docker stack deploy --compose-file=<(docker-compose -f docker-compose.yml config 2>/dev/null) DEV
```
* Размещаются приложения по нодам при помощи constraints например
```
constraints:
          - node.role == worker
```
* Реплицируются при помощи replicated mode
*  __Задание *__  В моем случае  когда добавил  worker-3 Уехало только одно приложение которое было global. Когда сделал число репликации 3 разъехались приложения на третью ноду
Можно сделать вывод что очень лениво делается балансировка при скейлинге нод (Хотя может если бы приложение было падучее или под нагрузкой все было бы по другому )
* Накрутил ручки restart_policy resources update_config в соотвествии с заданием
* __Задание ***__ Compose использует .env файл в директории поэтому создал директории PROD и TEST сделал в них симлинку на docker-compose.yml и добавил env файлы где стабильные версии для прода и latest для теста
Соотвественно команда останется прежняя
```
cd TEST; docker stack deploy --compose-file=<(docker-compose -f docker-compose.yml config 2>/dev/null) DEV; сd ..
cd PROD; docker stack deploy --compose-file=<(docker-compose -f docker-compose.yml config 2>/dev/null) DEV; cd ..
```

# homework - 25

* Работа с EFK стеком, это как ELK только с fluentd вместо логстеша
* Cкопированы новые сорцы с https://github.com/express42/reddit/tree/logging
* Пересобраны контейнеры приложения командой make
* Изначально приложения были не рабочие (не понятно баг это или фича) 
* Создан файл docker/docker-compose-logging.yml с EFK
* Создан докерфайл и конфиг docker/fluentd
* Настроена отпрака логов в fluentd и просмотр их в кибане
* Добавлен фильтр на основе грока
* Настроен zipkin

Задания со звездочкой

* добавлен грок для второго варианта
* Найден проблемный кусок

# homework -23

* Разнес по файлам docker-compose.yml  и docker-compose-monitoring.yml, приложение и его мониторинг соответственно 
* Появился новый контейнер cAdvisor
* Появился новый контейнер graphana
* Добавил новые шаблоны Business_Logic_Monitoring.json DockerMonitoring.json (скачал с сайта графаны) UI_SERVICE_MONITORING.json
* Появился новый контйенер alermanager
* В нем уведомление по почте и по slack
* Сделал задания с одной звездочкой

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
