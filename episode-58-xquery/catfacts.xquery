<catfacts>{
  for $name in json:doc("catfacts.json")//text
  return <fact>{data($name)}</fact>
}</catfacts>
