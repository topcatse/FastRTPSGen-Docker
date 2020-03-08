## Fast RTPS Gen Docker

eProsima FASTRTPSGEN is a Java application that generates source code using the data types defined in an IDL file. This generated source code can be used in your applications in order to publish and subscribe to a topic of your defined type. Cf. <https://fast-rtps.docs.eprosima.com/en/latest/geninfo.html#fastrtpsgen-intro>.

To build the image:

```
docker image build -t fastrtpsgen .
```

Generate, e.g., an example project in the current directory given Hello.idl by:

```
docker run --rm -v $(pwd):/work fastrtpsgen -replace -example CMake Hello.idl
```