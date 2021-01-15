# ScatteredWDL
Test wdl used to determine if scattered tasks are discrete

From running the wdl, it has been determined that each task is most likely discrete since each task creates its own containers and requests it own runtime attributes. This can be confusing and costly for someone who expects a workflow to distribute memory to each scattered task.

I have also looked into how to equally split memory for a workflow although that could lead to confusion as well causing too little memory to be used.
