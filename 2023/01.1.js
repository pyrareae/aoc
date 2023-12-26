import fs from "node:fs";
import path from "node:path";
import {map, pipe, sum, match, tap, head, last, filter, concat, apply, reduce, join} from "ramda"
const file = fs.readFileSync(path.resolve('./2023/01.txt'));
const data = file.toString().split("\n");

const toPair = arr => [head(arr), last(arr)]
const truthy = x => !!x

const processFile = pipe(
  map(pipe(
    match(/(\d)/g),
    toPair,
    join(''),
    Number,
  )),
  filter(truthy),
  sum
)

console.log(processFile(data))
