declare option output:method "json";

<json type="array">{
  for $n in (1 to 10)
  return <_ type="object">
    <number type="number">{$n}</number>
    <odd type="boolean">true</odd>
    <even type="boolean">false</even>
  </_>
}</json>
