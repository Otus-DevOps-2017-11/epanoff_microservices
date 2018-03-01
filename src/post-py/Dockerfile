FROM python:3.6.0-alpine
RUN pip install flask==0.12.2 pymongo==3.6.0
WORKDIR /app
COPY . /app
RUN pip install -r /app/requirements.txt
ENV POST_DATABASE_HOST post_db
ENV POST_DATABASE posts
CMD ["python3", "post_app.py"]
