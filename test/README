Tests
=====

Why Shell Scripts?
------------------
Since the only way to reliably test whether the process ID according to Crystal matches the process ID according to the various shells<sup>1</sup> is to use those shells to compare them, it only made sense to write my tests in shell scripts.  Instead of trying to find a TDD/BDD framework that could do everything I needed—even though my needs may not have been entirely clear to me before I started—it seemed most sensible to just write my tests and let any minimal framework emerge from my attempts to keep things DRY (as DRY as each shell allowed, and different shells allowed different levels of DRYness).  So that's what you have here.  In retrospect there might have been a better approach, but simply writing my own scripts was simple enough, and posed no apparent problems and had no obvious landmines.  Finding and evaluating TDD/BDD frameworks for shell scripts, on the other hand, sounds like a project unto itself.

So here you have it.


---

<sup>1</sup> Actually it's the *parent's* process ID from Crystal's point of view that needs to match the *process ID* from the script's point of view, since the script spawns the Crystal program and is therefore its parent.