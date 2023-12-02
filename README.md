<div align="center">
  <h1>
    NEOVIM IDE
  </h1>
  <p>
    <a href="#dependencies">Dependencies</a>
    •
    <a href="#instructions">How to Use</a>
    •
    <a href="#documentations">Documentations</a>
  </p>
  <p align="left">
    This project attempts to create an IDE-like experience for writing and editing code with nvim.
  </p>
</div>

<div id="dependencies">
  <h2>
    Dependencies
  </h2>
  <p>
    You need <a href="https://neovim.io">neovim</a> v.0.9.4 or newer and <a href="https://www.lua.org">Lua</a> on your computer to use the project.
  If you are using MacOS, the default terminal may not display the correct colors.
  In this case, I highly recommend to use <a href="https://iterm2.com">iTerm2</a> instead.
  </p>
<div>

<div id="instructions">
  <h2>
    How to use
  </h2>
  <p>
    During startup, nvim looks for a configuration file inside the nvim directory, typically '~/.config/nvim/'.
    To use the project, you can simply copy all files in this repository into the directory or clone the repository using <a href="https://git-scm.com">Git</a>:
  </p>
  <pre><code class="language-bash"><!--
  -->git clone https://github.com/rezhaTanuharja/nvimIDE.git ~/.config/nvim<!--
  --></code></pre>
  <p>
    Once you have all the files inside '~/.config/nvim/', start nvim and run the following command:
  </p>
  <pre><code class="language-bash"><!--
  -->:PackerSync<!--
  --></code></pre>
  <p>
    The command will trigger Packer to install all plugins from their repository as specified in 'lua/rezha/plugins.lua'.
    Subsequently, close and reopen nvim.
    Some plugins like Mason and Treesitter will automatically install everything needed for their functionalities.
    You may need to close and reopen nvim after these installations.
  </p>
</div>

<div id="documentations">
  <h2>
    Documentations
  </h2>
  <p>
    Coming soon!
  </p>
</div>