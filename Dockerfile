FROM alpine:3.19
WORKDIR /app
COPY app/ /app/
RUN chmod +x /app/app.sh
EXPOSE 8080
CMD ["/app/app.sh"]
