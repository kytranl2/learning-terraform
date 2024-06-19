FROM python:3.9-slim

COPY requirements.txt /app/requirements.txt 
RUN pip install -r /app/requirements.txt 

COPY transformation_service.py /app/transformation_service.py 

WORKDIR /app

CMD ["python", "transformation_service.py"]