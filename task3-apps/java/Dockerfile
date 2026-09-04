FROM openjdk:11-jdk-slim AS builder
WORKDIR /app
COPY Main.java .
RUN javac Main.java

FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=builder /app/Main.class .
COPY --from=builder /app/Main\$MyHandler.class .
EXPOSE 4003
CMD ["java", "Main"]
