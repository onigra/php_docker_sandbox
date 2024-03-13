# syntax=docker/dockerfile:1

FROM public.ecr.aws/amazonlinux/amazonlinux:2 as base

RUN yum update -y && yum clean all
RUN amazon-linux-extras install php7.3
RUN yum install -y \
  php-cli php-common php-devel \
  php-pecl-apcu php-pecl-apcu-bc php-pecl-mcrypt php-pecl-msgpack php-pecl-zip \
  php-gd php-process php-xml && \
  yum clean all

FROM base as build


# FROM base AS final
#
# # # Create a non-privileged user that the app will run under.
# # # See https://docs.docker.com/go/dockerfile-user-best-practices/
# # ARG UID=10001
# # RUN adduser \
# #     --disabled-password \
# #     --gecos "" \
# #     --home "/nonexistent" \
# #     --shell "/sbin/nologin" \
# #     --no-create-home \
# #     --uid "${UID}" \
# #     appuser
# # USER appuser
#
# # Copy the executable from the "build" stage.
# COPY --from=build /bin/hello.sh /bin/
#
# # What the container should run when it is started.
# ENTRYPOINT [ "/bin/hello.sh" ]
