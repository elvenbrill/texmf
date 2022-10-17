# texmf

My personal _local additions_ to the `texmf` directory tree.

## Setup

Clone the repository and set the `TEXMFHOME` environment variable to the
location of the cloned repository.

```bash
git clone https://github.com/elvenbrill/texmf.git
ln -s /path/to/clone/texmf ~/texmf
texhash ~/texmf
```

Once your files are in the right place, rebuild your TeX indexes:

```bash
sudo mktexlsr
```

For other systems, try `sudo texhash` or similar.  Your TeXlive installation manager also has a button under Actions for doing this (`tlmgr`: "Update filename database"; `tlshell`: "Regenerate filename database").

## Updates

These files change in small ways quite often (weekly? monthly?), so do a `git pull` from time to time to get the latest versions.

## License

Public domain. See the file LICENSE for more details. (Quite obviously this only
applies to stuff I've written, i.e., things without an explicit attribution.)

Happy TeXing!
