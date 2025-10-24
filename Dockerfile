#Use a AWS base image for Python 3.12
FROM public.ecr.aws/lambda/python:3.12

#Install build-essential compiler and tools
RUN microdnf update -y && microdnf install -y gcc-c++ make

#Copy requirements.txt
COPY requirements.txt ${LAMBDA_TASK_ROOT}

#Install packages
RUN pip install -r requirements.txt

#Copy function code
COPY travelAgent.py ${LAMBDA_TASK_ROOT}/travel_agent.py

#Set the CMD to your handler
CMD ["travel_agent.lambda_handler"]