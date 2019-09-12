FROM python:3.7 as build-stage

# make a virtualenv
RUN C:\Python\python.exe -m venv C:\venv
RUN C:\venv\Scripts\python.exe -m pip install -U pip setuptools

COPY requirements.txt C:/requirements.txt
RUN C:\venv\Scripts\pip3.exe install -U -r C:\requirements.txt

# Copy application
RUN mkdir C:\source
WORKDIR C:/source
COPY ./source .

FROM python:3.7 AS run-stage

COPY --from=build-stage C:/venv C:/venv
COPY --from=build-stage C:/source C:/source

ENV PYTHONFAULTHANDLER=true
ENV PATH=C:/venv/Scripts:$PATH VIRTUAL_ENV=C:/venv

EXPOSE 8000

COPY entrypoint.bat .

WORKDIR C:/source

ENTRYPOINT ["C:/entrypoint.bat"]
