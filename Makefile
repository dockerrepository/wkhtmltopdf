build_python27:
	docker build -f python-2.7/Dockerfile -t dockerrepository/wkhtmltopdf:2.7 ./python-2.7/

build_python36:
	docker build -f python-3.6/Dockerfile -t dockerrepository/wkhtmltopdf:3.6 ./python-3.6/

build_python37:
	docker build -f python-3.7/Dockerfile -t dockerrepository/wkhtmltopdf:3.7 ./python-3.7/