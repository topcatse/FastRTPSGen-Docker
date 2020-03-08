FROM alpine:3.9 as builder

# Install build dependences
RUN apk add --no-cache --update \
    git \
    openjdk8 \
    gradle

# Build FastRTPSGen
RUN git clone --depth 1 --single-branch --branch v1.0.3 --recursive https://github.com/eProsima/Fast-RTPS-Gen.git
WORKDIR /Fast-RTPS-Gen
RUN gradle assemble

# -----------------------------

FROM alpine:3.9

RUN apk add --no-cache --update \
    gcc \
    bash \
    openjdk8

COPY --from=builder /Fast-RTPS-Gen/share/fastrtps/fastrtpsgen.jar /usr/local/lib/

WORKDIR /work

ENTRYPOINT [ "java", "-jar", "/usr/local/lib/fastrtpsgen.jar" ]

