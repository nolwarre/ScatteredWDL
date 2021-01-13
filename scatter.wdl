version 1.0

task foo {
  input {
    File in
    Int RAM
  }
  String ram = "ramusage.txt"
  command {
    free -m > ${ram}
    sleep 1m
  }
  #specify the output(s) of this task so cromwell will keep track of them
  output {
    File out = "${ram}"
  }
  runtime {
    memory: RAM + "GB"
    docker: 'ubuntu:latest'
  }
}

workflow test {
  input {
    Array[File] inputs
    Int memory = 4
  }
  scatter(file in inputs) {
    call foo {
      input:
        in = file,
        RAM = memory
    }
  }
}
