<messages>
  {
    for $name in doc("hello.xml")//name
    return <message>Hello, {data($name)}!</message>
  }
</messages>
