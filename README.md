 Book Shop — Docker Deployment

 Prerequisites
  Docker Desktop installed and running
  Git installed

 Setup & Run

 1. Clone the repository
git clone https://github.com/ayat93a/book_shop.git
cd book_shop/book-shop

2. Create your .env file
cp .env.example .env
Then open .env and fill in your values.

 3. Build and start all services
docker compose up --build

4. Run database migrations (first time only)
docker compose exec backend python manage.py migrate

5. Visit the app
Open your browser and go to: http://localhost

Services
db — PostgreSQL 15 database
backend — Django app served by Gunicorn on port 8000
nginx — Reverse proxy on port 80, also serves static files

 Useful Commands

Command What it does 

docker compose up --build  Build and start everything 
docker compose down  Stop all containers 
docker compose down -v Stop and delete database (fresh start) 
docker compose exec backend python manage.py migrate Run migrations 
docker compose exec backend python manage.py createsuperuser Create admin user 

test
 Admin Panel
Visit http://localhost/admin after creating a superuser.

Lian Abu Ajamieh 20230099
Rama Akef 20231299
