FROM scratch
LABEL maintainer="Christopher Collins <collins.christopher@gmail.com>"

COPY pkg/* /
CMD [ "/goApp" ]
