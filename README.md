#favouriteQ


What&#39;s your [favourite question](http://favouritequestion.com)?

Follow [@favouriteq](http://twitter.com/favouriteq) for daily questions

Another [Gunt London](http://guntlondon.com) production

---

##Installation


###Database

Create a mysql database called `favouriteq`

Create tables for apps that aren't using south

```
./manage.py syncdb
```

Create tables for apps that are using south. Data will be loaded from fixtures

```
./manage.py migrate
```

During development developers should continue to run the ./manage.py migrate command to keep their DB up to date. 

###Virtual environment

Create virtual environment

```
virtualenv --no-site-packages env
```

(if you don't have virtualenv, install it: `sudo pip install virtualenv`)

(if you don't have pip, install it: `sudo easy_install pip`)


Activate virtual environment

```
source env/bin/activate
```


###Dependencies

From the root

```
pip install -r requirements/requirements.txt
```


###Run

From the root

```
cd favouriteQ
python manage.py runserver
```

Open [http://127.0.0.1:8000/](http://127.0.0.1:8000/) in a browser