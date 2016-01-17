# Limba Neverball Example

This is a more complex example on how to create a Limba[1] package.
It demonstrates how to:
 * Build a Limba package with the build-helper
 * Handle multiple dependencies
 * Create a Limba repository
 * Automatize the build process

More information and explanations of the single steps will follow.

The final Limba repository, containing Neverball with all its dependencies,
can be found here: http://people.freedesktop.org/~mak/stuff/neverball-lirepo/

Please keep in mind that this repository contains software from multiple organizations,
using different licenses. Please refer to the individual projects for more information about
licensing.

The Limba package definitions are public domain or subjected to the MIT license. Descriptions
might be copyrighted by the respective project which wrote them (refer to the individual files).

### Can I install the prebuilt binaries?
Yes, please test them! We only ship prebuilt binaries for amd64 right now, though.

1. Get Limba from [2], compile and install it (the Git master version has some quirk fixes,
   so it's recommended to use it).

2. Open `/etc/limba/sources.list` (create file and directory if necessary) and add
   a line containing: ```http://people.freedesktop.org/~mak/stuff/neverball-lirepo/```

3. Run `sudo limba trust-key BF4DECEB` to trust the repository you just added.

4. Run `sudo limba refresh` to refresh the index of available packages.

5. Run `sudo limba install neverball-1.6.0` (append `--verbose` to see what is going on)

6. Run Neverball from your desktop's launcher, or by typing neverball-1.6.0 in the console.

Note: Every Limba command has a `--verbose` flag, if you want to see what's going on.

[1]: http://people.freedesktop.org/~mak/limba/
[2]: https://github.com/ximion/limba
