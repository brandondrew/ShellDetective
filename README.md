Shell Detection
===============

The Problem
-----------
Although it seems like it ought to be extremely easy to get the name of your current shell, doing so in a consistent and reliable way is actually extremely difficult.  In fact, according to many people on Stack Exchange sites, it is impossible.

If you already know which shell you're using, it's not hard to find a way that works *for that shell*, but something that works for you when you don't already know the shell&mdash;that's another matter.

Why do this?  When would you not already know it?  You may want to know the shell in order to gracefully handle differences between them, but those very differences are the things which prevent you from figuring it out.  The ground beneath your feet moves before you can get anywhere, and soon you find yourself sinking into quicksand of syntactical (and philosophical) differences between the shells.

In fact there are no fewer than three questions on Stack Exchange sites grappling with this very problem, and none of them have answers which I find satisfactory, so I set out to solve this problem once and for all.

There is one thing that all shells have in common, though, and it is only obvious once it is pointed out&mdash;searching for something that all shells do in the same way seems futile until you come across this approach.  In fact, once pointed out, it seems like cheating.  The one thing they have in common is this: they're very good at calling external programs.  *That* is the key to the solution.  Because you can't count on enough consistency between the many shells, you need to put your logic into an external program.  That's what I've written for you.

You can think of this problem as being a *little bit* like writing code that can handle multiple browsers: there's a law of diminishing returns the more browsers you decide to support.  Just supporting the two or three biggest players still leaves a significant unsupported population, but trying to support everything leads to insanity.  The proportions with shells may be different, but the principle is the same.  Although I've attempted to make this program support *anything*, I don't expect anyone to every write a shell script that can possible be portable across all shells.  But just because it is extremely difficult (or impossible) to write a script that will run on both the csh family of shells and the bourne family of shells does not mean that your utility should be unable to tell you exactly what shell you're using.

In fact, we should refocus a bit here.  You will most likely *never* write a *script* that you will want to be so flexible, since any script can specify which shell interpreter it expects.  But if you're like me, you may want to have a portable set of *functions and aliases* that you can carry from machine to machine, and use from bash or zsh&mdash;depending on which is available on that particular machine&mdash;and sometimes ksh.  And, if you're like me, you may be flirting with `fish`, the "friendly interactive shell", and *really* like certain of its features, but also find its differences very frustrating.  ***This*** is what led me to want to be able to detect the current shell.  Functions would be sourced by my `.zshrc` file, my `.bash_profile`, and my `fish` config file, and within the function I'd want to be able to have the branching to distinguish between shells and run the appropriate code.

In fact it may turn out to be easier to have one file for the function for bourne-like shells and another file for the equivalent function for `fish`, but I still want my shell-detection utility to be robust and complete.  The fact that the practical problem that this utility is serving might end up needing *less* of what the utility has to offer is not, in my opinion, a good reason for making the utility feeble, or only able to distinguish between (say) `bash` and `zsh`.


Testing
-------
You can test that everything is working as it should, one shell at a time, e.g.

    test/test.bash

or in one fell swoop:

    for testfile in test/test.*; do
      $testfile
    done

The test files should be executable already&mdash;Git preserves the executable bit.  But just in case for some reason they are not, you can make them so, of course, from the root of the project:

    chmod u+x test/test.*

Installation
------------
Just put shell_name in, for instance, your `~/bin` directory, or anywhere else you prefer to keep executable files, such as perhaps `/usr/local/bin`.

If it does not work as it is, please let me know, and let me know what platform you're on, and I'll try to get that taken care of.


Contributing
------------
If you find any cases where this fails, ***please*** [bring it to my attention](https://github.com/brandondrew/ShellDetector/issues/new)

Feature requests and pull requests are welcome as well.


Roadmap
-------
* Make it easier to install
  + Homebrew?
  + Crystal shards?
  + Jester? ;)
* Add new features from the secret documentation (can you find it?) :D

TL;DR
-----
The purpose behind this project is to reliably and unambiguously determine which shell is being used, but the purpose *behind that purpose* is to make it possible to write functions that can be sourced by the startup files of multiple shells, so that you might sync your configuration files across many machines&mdash;possibly hundreds of servers&mdash;and have access to your favorite functions even if the system administrators for some machines are unwilling to install `zsh`, or maybe even `bash` on their machines.  (Yes, I've had to deal with `ksh` before!)  It is also to make it easier for you to switch from one to another, such as if you want to experiment with `fish` but can't get along without all your custom functions.

Lessons Learned
---------------
The key insights in making it possible to determine the running shell is the fact that
1. shells do almost nothing in a universally consistent way (unless you take a small subset of shells)
2. the one thing they do consistently is call outside programs

This leads me to the conclusion that rather than writing shell functions that I can use from multiple shells, it would be tremendously easier in some cases to simply write individual utilities and put them in my `~/bin` directory.  There may be a serious of questions to answer to decide which set of trade-offs are preferable, but this is at least an option to consider.  Previously I've avoided simply writing everything in Ruby because this creates its own set of problems&mdash;sysadmins that won't install `zsh` probably won't install Ruby either&mdash;and Travelling Ruby is fairly new.  Crystal, however, should make all of this a non-issue.  We'll see...

What's Crystal?
---------------
An elevator pitch for [Crystal](http://crystal-lang.org) might be that it is basically "compiled Ruby".  That description is not entirely accurate, but it gives you a good idea why it has a strong appeal.  There are some changes to the syntax and semantics of the language to support compilation and related needs, but its creators have worked remarkably hard to give it the flexibilty of a dynamically-typed interpreted langauge, even though you get the speed of a compiled language.  They also value the elegance and readability of Ruby and have worked hard to preserve (and even improve upon) them.  If you know and like Ruby, then you'll be able to immediately read and write Crystal, and only have to learn a few key differences before you can dive in head-first.  The main advantage to me of being able to compile my Ruby code (well, my Ruby-like code) is that I don't have to worry at all about what version a user has installed, or *if* they have any version of Ruby installed.  This is essentially the problem that [Traveling Ruby](http://phusion.github.io/traveling-ruby/) solves, but if you don't need any gems that have not been rewritten for Crystal, then Crystal also makes a great option, and one that strikes me as a lot simpler.  It seems perfect in every way for command-line utilities, especially ones that can be supported by multiple shells on multiple platforms.

Where's all the Code?
---------------------
There's no particular virtue in writing *more code*, even though the brass at IBM thought that that was a good way to determine how to pay Microsoft, back in the day when the latter was doing the bidding of the former.  The virtue is in writing *the right code*, which solves the problem, even if it is a small problem.  (Sometimes there's value in simply proving that something can be done!)
=======

