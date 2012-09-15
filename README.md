#favouriteQ


What&#39;s your [favourite question](http://favouritequestion.com)?

Follow [@favouriteq](http://twitter.com/favouriteq) for daily questions

Another [Gunt London](http://guntlondon.com) production

---

##Installation


###Database

* Create a mysql database called `favouriteq`
* Install the latest mysql database SQL dump from `/data/sql`


###Virtual environment

Create virtual environment

```
virtualenv --no-site-packages env
```
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