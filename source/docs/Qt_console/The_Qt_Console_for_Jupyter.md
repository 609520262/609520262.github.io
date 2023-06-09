---
title: The Qt Console for Jupyter
date: 2023-03-08 21:55:23
---
{% raw %}


  
    <section data-toggle="wy-nav-shift" class="wy-nav-content-wrap"><nav class="wy-nav-top" aria-label="移动版导航菜单" >
          <i data-toggle="wy-nav-top" class="fa fa-bars"></i>
          <a href="../../index.html">Entropy theory</a>
      </nav>

      <div class="wy-nav-content">
        <div class="rst-content">
          <div role="navigation" aria-label="页面导航">
  <ul class="wy-breadcrumbs">
      <li><a href="../../index.html" class="icon icon-home"></a></li>
      <li class="breadcrumb-item active">The Qt Console for Jupyter</li>
<li class="wy-breadcrumbs-aside">
   <a href="https://github.com/609520262/Deploy-static-content-to-Pages/tree/main/docs/index.rst" class="fa fa-github"> 在 GitHub 上编辑</a>
</li>

  </ul>
  <hr/>
</div>
          <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
           <div itemprop="articleBody">
             
  <section id="the-qt-console-for-jupyter">
<h1>The Qt Console for Jupyter<a class="headerlink" href="#the-qt-console-for-jupyter" title="此标题的永久链接"></a></h1>
<p>To start the Qt console::</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span>$ jupyter qtconsole
</pre></div>
</div>
</section>
<section id="overview">
<h1>Overview<a class="headerlink" href="#overview" title="此标题的永久链接"></a></h1>
<p>The Qt console is a very lightweight application that largely feels like a
terminal, but provides a number of enhancements only possible in a GUI, such as
inline figures, proper multi-line editing with syntax highlighting, graphical
calltips, and much more. The Qt console can use any Jupyter kernel.</p>
<figure class="align-center" id="id3">
<a class="reference external image-reference" href="/assets/qtconsole.png"><img alt="Qt console with embedded plots" src="/assets/qtconsole.png"></a>
<figcaption>
<p><span class="caption-text">The Qt console with IPython, using inline matplotlib plots.</span><a class="headerlink" href="#id3" title="Permalink to this image"></a></p>
</figcaption>
</figure>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span><span class="n">The</span> <span class="n">Qt</span> <span class="n">console</span> <span class="k">with</span> <span class="n">IPython</span><span class="p">,</span> <span class="n">using</span> <span class="n">inline</span> <span class="n">matplotlib</span> <span class="n">plots</span><span class="o">.</span>
</pre></div>
</div>
<p>The Qt console frontend has hand-coded emacs-style bindings for text
navigation. This is not yet configurable.</p>
<p>.. tip::</p>
<p>Since the Qt console tries hard to behave like a terminal, by default it
immediately executes single lines of input that are complete.  If you want
to force multi-line input, hit :kbd:<code class="docutils literal notranslate"><span class="pre">Ctrl-Enter</span></code> at the end of the first line
instead of :kbd:<code class="docutils literal notranslate"><span class="pre">Enter</span></code>, and it will open a new line for input.  At any
point in a multi-line block, you can force its execution (without having to
go to the bottom) with :kbd:<code class="docutils literal notranslate"><span class="pre">Shift-Enter</span></code>.</p>
</section>
<section id="inline-graphics">
<h1>Inline graphics<a class="headerlink" href="#inline-graphics" title="此标题的永久链接"></a></h1>
<p>One of the most exciting features of the Qt Console is embedded figures.
You can plot with matplotlib in IPython, or the plotting library of choice
in your kernel.</p>
<a class="reference internal image-reference" href="/assets/besselj.png"><img alt="/assets/besselj.png" src="/assets/besselj.png" style="width: 519px;"></a>
</section>
<section id="saving-and-printing">
<h1>Saving and Printing<a class="headerlink" href="#saving-and-printing" title="此标题的永久链接"></a></h1>
<p>The Qt Console has the ability to save your current session, as either HTML or
XHTML. Your inline figures will be PNG in HTML, or inlined as SVG in XHTML.
PNG images have the option to be either in an external folder, as in many
browsers’ “Webpage, Complete” option, or inlined as well, for a larger, but
more portable file.</p>
<p>.. note::</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span><span class="n">Export</span> <span class="n">to</span> <span class="n">SVG</span><span class="o">+</span><span class="n">XHTML</span> <span class="n">requires</span> <span class="n">that</span> <span class="n">you</span> <span class="n">are</span> <span class="n">using</span> <span class="n">SVG</span> <span class="n">figures</span><span class="p">,</span> <span class="n">which</span> <span class="ow">is</span> <span class="o">*</span><span class="ow">not</span><span class="o">*</span>
<span class="n">the</span> <span class="n">default</span><span class="o">.</span>  <span class="n">To</span> <span class="n">switch</span> <span class="n">the</span> <span class="n">inline</span> <span class="n">figure</span> <span class="nb">format</span> <span class="ow">in</span> <span class="n">IPython</span> <span class="n">to</span> <span class="n">use</span> <span class="n">SVG</span><span class="p">,</span> <span class="n">do</span><span class="p">:</span>

<span class="o">..</span> <span class="n">sourcecode</span><span class="p">::</span> <span class="n">ipython</span>

    <span class="n">In</span> <span class="p">[</span><span class="mi">10</span><span class="p">]:</span> <span class="o">%</span><span class="n">config</span> <span class="n">InlineBackend</span><span class="o">.</span><span class="n">figure_format</span> <span class="o">=</span> <span class="s1">&#39;svg&#39;</span>

<span class="n">Or</span><span class="p">,</span> <span class="n">you</span> <span class="n">can</span> <span class="n">add</span> <span class="n">the</span> <span class="n">same</span> <span class="n">line</span> <span class="p">(</span><span class="n">c</span><span class="o">.</span><span class="n">Inline</span><span class="o">...</span> <span class="n">instead</span> <span class="n">of</span> <span class="o">%</span><span class="n">config</span> <span class="n">Inline</span><span class="o">...</span><span class="p">)</span> <span class="n">to</span>
<span class="n">your</span> <span class="n">config</span> <span class="n">files</span><span class="o">.</span>

<span class="n">This</span> <span class="n">will</span> <span class="n">only</span> <span class="n">affect</span> <span class="n">figures</span> <span class="n">plotted</span> <span class="n">after</span> <span class="n">making</span> <span class="n">this</span> <span class="n">call</span>
</pre></div>
</div>
<p>The widget also exposes the ability to print directly, via the default print
shortcut or context menu.</p>
<p>See these examples of :download:<code class="docutils literal notranslate"><span class="pre">png/html&lt;figs/jn.html&gt;</span></code> and
:download:<code class="docutils literal notranslate"><span class="pre">svg/xhtml</span> <span class="pre">&lt;figs/jn.xhtml&gt;</span></code> output. Note that syntax highlighting
does not survive export. This is a known issue, and is being investigated.</p>
</section>
<section id="colors-and-highlighting">
<h1>Colors and Highlighting<a class="headerlink" href="#colors-and-highlighting" title="此标题的永久链接"></a></h1>
<p>Terminal IPython has always had some coloring, but never syntax
highlighting. There are a few simple color choices, specified by the <code class="docutils literal notranslate"><span class="pre">colors</span></code>
flag or <code class="docutils literal notranslate"><span class="pre">%colors</span></code> magic:</p>
<ul class="simple">
<li><p>LightBG for light backgrounds</p></li>
<li><p>Linux for dark backgrounds</p></li>
<li><p>NoColor for a simple colorless terminal</p></li>
</ul>
<p>The Qt widget, however, has full syntax highlighting as you type, handled by
the <code class="docutils literal notranslate"><span class="pre">pygments</span></code>_ library. The <code class="docutils literal notranslate"><span class="pre">style</span></code> argument exposes access to any style by
name that can be found by pygments, and there are several already
installed.</p>
<p>Screenshot of <code class="docutils literal notranslate"><span class="pre">jupyter</span> <span class="pre">qtconsole</span> <span class="pre">--style</span> <span class="pre">monokai</span></code>, which uses the ‘monokai’
theme:</p>
<a class="reference internal image-reference" href="/assets/colors_dark.png"><img alt="/assets/colors_dark.png" src="/assets/colors_dark.png" style="width: 627px;"></a>
<p>.. Note::</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span>Calling ``jupyter qtconsole -h`` will show all the style names that
pygments can find on your system.
</pre></div>
</div>
<p>You can also pass the filename of a custom CSS stylesheet, if you want to do
your own coloring, via the <code class="docutils literal notranslate"><span class="pre">stylesheet</span></code> argument.  The default LightBG
stylesheet:</p>
<p>.. sourcecode:: css</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span><span class="n">QPlainTextEdit</span><span class="p">,</span> <span class="n">QTextEdit</span> <span class="p">{</span> <span class="n">background</span><span class="o">-</span><span class="n">color</span><span class="p">:</span> <span class="n">white</span><span class="p">;</span>
        <span class="n">color</span><span class="p">:</span> <span class="n">black</span> <span class="p">;</span>
        <span class="n">selection</span><span class="o">-</span><span class="n">background</span><span class="o">-</span><span class="n">color</span><span class="p">:</span> <span class="c1">#ccc}</span>
<span class="o">.</span><span class="n">error</span> <span class="p">{</span> <span class="n">color</span><span class="p">:</span> <span class="n">red</span><span class="p">;</span> <span class="p">}</span>
<span class="o">.</span><span class="ow">in</span><span class="o">-</span><span class="n">prompt</span> <span class="p">{</span> <span class="n">color</span><span class="p">:</span> <span class="n">navy</span><span class="p">;</span> <span class="p">}</span>
<span class="o">.</span><span class="ow">in</span><span class="o">-</span><span class="n">prompt</span><span class="o">-</span><span class="n">number</span> <span class="p">{</span> <span class="n">font</span><span class="o">-</span><span class="n">weight</span><span class="p">:</span> <span class="n">bold</span><span class="p">;</span> <span class="p">}</span>
<span class="o">.</span><span class="n">out</span><span class="o">-</span><span class="n">prompt</span> <span class="p">{</span> <span class="n">color</span><span class="p">:</span> <span class="n">darkred</span><span class="p">;</span> <span class="p">}</span>
<span class="o">.</span><span class="n">out</span><span class="o">-</span><span class="n">prompt</span><span class="o">-</span><span class="n">number</span> <span class="p">{</span> <span class="n">font</span><span class="o">-</span><span class="n">weight</span><span class="p">:</span> <span class="n">bold</span><span class="p">;</span> <span class="p">}</span>
<span class="o">/*</span> <span class="o">.</span><span class="n">inverted</span> <span class="ow">is</span> <span class="n">used</span> <span class="n">to</span> <span class="n">highlight</span> <span class="n">selected</span> <span class="n">completion</span> <span class="o">*/</span>
<span class="o">.</span><span class="n">inverted</span> <span class="p">{</span> <span class="n">background</span><span class="o">-</span><span class="n">color</span><span class="p">:</span> <span class="n">black</span> <span class="p">;</span> <span class="n">color</span><span class="p">:</span> <span class="n">white</span><span class="p">;</span> <span class="p">}</span>
</pre></div>
</div>
</section>
<section id="fonts">
<h1>Fonts<a class="headerlink" href="#fonts" title="此标题的永久链接"></a></h1>
<p>The Qt console is configurable via the ConsoleWidget. To change these, set the
<code class="docutils literal notranslate"><span class="pre">font_family</span></code> or <code class="docutils literal notranslate"><span class="pre">font_size</span></code> traits of the ConsoleWidget. For instance, to
use 9pt Anonymous Pro::</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span>$&gt; jupyter qtconsole --ConsoleWidget.font_family=&quot;Anonymous Pro&quot; --ConsoleWidget.font_size=9
</pre></div>
</div>
</section>
<section id="process-management">
<h1>Process Management<a class="headerlink" href="#process-management" title="此标题的永久链接"></a></h1>
<p>With the two-process ZMQ model, the frontend does not block input during
execution. This means that actions can be taken by the frontend while the
Kernel is executing, or even after it crashes. The most basic such command is
via ‘Ctrl-.’, which restarts the kernel.  This can be done in the middle of a
blocking execution. The frontend can also know, via a heartbeat mechanism, that
the kernel has died. This means that the frontend can safely restart the
kernel.</p>
<p>.. _multiple_consoles:</p>
<section id="multiple-consoles">
<h2>Multiple Consoles<a class="headerlink" href="#multiple-consoles" title="此标题的永久链接"></a></h2>
<p>Since the Kernel listens on the network, multiple frontends can connect to it.
These do not have to all be qt frontends - any Jupyter frontend can connect and
run code.</p>
<p>Other frontends can connect to your kernel, and share in the execution. This is
great for collaboration.  The <code class="docutils literal notranslate"><span class="pre">--existing</span></code> flag means connect to a kernel
that already exists.  Starting other consoles
with that flag will not try to start their own kernel, but rather connect to
yours.  :file:<code class="docutils literal notranslate"><span class="pre">kernel-12345.json</span></code> is a small JSON file with the ip, port, and
authentication information necessary to connect to your kernel. By default, this file
will be in your Jupyter runtime directory.  If it is somewhere else,
you will need to use the full path of the connection file, rather than
just its filename.</p>
<p>If you need to find the connection info to send, and don’t know where your connection file
lives, there are a couple of ways to get it. If you are already running a console
connected to an IPython kernel, you can use the <code class="docutils literal notranslate"><span class="pre">%connect_info</span></code> magic to display the information
necessary to connect another frontend to the kernel.</p>
<p>.. sourcecode:: ipython</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span>In [2]: %connect_info
{
  &quot;stdin_port&quot;:50255,
  &quot;ip&quot;:&quot;127.0.0.1&quot;,
  &quot;hb_port&quot;:50256,
  &quot;key&quot;:&quot;70be6f0f-1564-4218-8cda-31be40a4d6aa&quot;,
  &quot;shell_port&quot;:50253,
  &quot;iopub_port&quot;:50254
}

Paste the above JSON into a file, and connect with:
    $&gt; ipython &lt;app&gt; --existing &lt;file&gt;
or, if you are local, you can connect with just:
    $&gt; ipython &lt;app&gt; --existing kernel-12345.json
or even just:
    $&gt; ipython &lt;app&gt; --existing
if this is the most recent kernel you have started.
</pre></div>
</div>
<p>Otherwise, you can find a connection file by name (and optionally profile) with
:func:<code class="docutils literal notranslate"><span class="pre">jupyter_client.find_connection_file</span></code>:</p>
<p>.. sourcecode:: bash</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span>$&gt; python -c &quot;from jupyter_client import find_connection_file;\
print(find_connection_file(&#39;kernel-12345.json&#39;))&quot;
/home/you/Library/Jupyter/runtime/kernel-12345.json
</pre></div>
</div>
<p>.. _kernel_security:</p>
</section>
<section id="security">
<h2>Security<a class="headerlink" href="#security" title="此标题的永久链接"></a></h2>
<p>.. warning::</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span><span class="n">Since</span> <span class="n">the</span> <span class="n">ZMQ</span> <span class="n">code</span> <span class="n">currently</span> <span class="n">has</span> <span class="n">no</span> <span class="n">encryption</span><span class="p">,</span> <span class="n">listening</span> <span class="n">on</span> <span class="n">an</span>
<span class="n">external</span><span class="o">-</span><span class="n">facing</span> <span class="n">IP</span> <span class="ow">is</span> <span class="n">dangerous</span><span class="o">.</span>  <span class="n">You</span> <span class="n">are</span> <span class="n">giving</span> <span class="nb">any</span> <span class="n">computer</span> <span class="n">that</span> <span class="n">can</span> <span class="n">see</span>
<span class="n">you</span> <span class="n">on</span> <span class="n">the</span> <span class="n">network</span> <span class="n">the</span> <span class="n">ability</span> <span class="n">to</span> <span class="n">connect</span> <span class="n">to</span> <span class="n">your</span> <span class="n">kernel</span><span class="p">,</span> <span class="ow">and</span> <span class="n">view</span> <span class="n">your</span> <span class="n">traffic</span><span class="o">.</span>
<span class="n">Read</span> <span class="n">the</span> <span class="n">rest</span> <span class="n">of</span> <span class="n">this</span> <span class="n">section</span> <span class="n">before</span> <span class="n">listening</span> <span class="n">on</span> <span class="n">external</span> <span class="n">ports</span>
<span class="ow">or</span> <span class="n">running</span> <span class="n">a</span> <span class="n">kernel</span> <span class="n">on</span> <span class="n">a</span> <span class="n">shared</span> <span class="n">machine</span><span class="o">.</span>
</pre></div>
</div>
<p>By default (for security reasons), the kernel only listens on localhost, so you
can only connect multiple frontends to the kernel from your local machine. You
can specify to listen on an external interface by specifying the <code class="docutils literal notranslate"><span class="pre">ip</span></code>
argument::</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span>$&gt; jupyter qtconsole --ip=192.168.1.123
</pre></div>
</div>
<p>If you specify the ip as 0.0.0.0 or ‘*’, that means all interfaces, so any
computer that can see yours on the network can connect to the kernel.</p>
<p>Messages are not encrypted, so users with access to the ports your kernel is using will be
able to see any output of the kernel. They will <strong>NOT</strong> be able to issue shell commands as
you due to message signatures.</p>
<p>.. warning::</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span><span class="n">If</span> <span class="n">you</span> <span class="n">disable</span> <span class="n">message</span> <span class="n">signatures</span><span class="p">,</span> <span class="n">then</span> <span class="nb">any</span> <span class="n">user</span> <span class="k">with</span> <span class="n">access</span> <span class="n">to</span> <span class="n">the</span> <span class="n">ports</span> <span class="n">your</span>
<span class="n">kernel</span> <span class="ow">is</span> <span class="n">listening</span> <span class="n">on</span> <span class="n">can</span> <span class="n">issue</span> <span class="n">arbitrary</span> <span class="n">code</span> <span class="k">as</span> <span class="n">you</span><span class="o">.</span> <span class="o">**</span><span class="n">DO</span> <span class="n">NOT</span><span class="o">**</span> <span class="n">disable</span> <span class="n">message</span>
<span class="n">signatures</span> <span class="n">unless</span> <span class="n">you</span> <span class="n">have</span> <span class="n">a</span> <span class="n">lot</span> <span class="n">of</span> <span class="n">trust</span> <span class="ow">in</span> <span class="n">your</span> <span class="n">environment</span><span class="o">.</span>
</pre></div>
</div>
<p>The one security feature Jupyter does provide is protection from unauthorized execution.
Jupyter’s messaging system will sign messages with HMAC digests using a shared-key. The key
is never sent over the network, it is only used to generate a unique hash for each message,
based on its content. When the kernel receives a message, it will check that the digest
matches, and discard the message. You can use any file that only you have access to to
generate this key, but the default is just to generate a new UUID.</p>
<p>.. _ssh_tunnels:</p>
</section>
<section id="ssh-tunnels">
<h2>SSH Tunnels<a class="headerlink" href="#ssh-tunnels" title="此标题的永久链接"></a></h2>
<p>Sometimes you want to connect to machines across the internet, or just across
a LAN that either doesn’t permit open ports or you don’t trust the other
machines on the network.  To do this, you can use SSH tunnels.  SSH tunnels
are a way to securely forward ports on your local machine to ports on another
machine, to which you have SSH access.</p>
<p>In simple cases, Jupyter’s tools can forward ports over ssh by simply adding the
<code class="docutils literal notranslate"><span class="pre">--ssh=remote</span></code> argument to the usual <code class="docutils literal notranslate"><span class="pre">--existing...</span></code> set of flags for connecting
to a running kernel, after copying the JSON connection file (or its contents) to
the second computer.</p>
<p>.. warning::</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span><span class="n">Using</span> <span class="n">SSH</span> <span class="n">tunnels</span> <span class="n">does</span> <span class="o">*</span><span class="ow">not</span><span class="o">*</span> <span class="n">increase</span> <span class="n">localhost</span> <span class="n">security</span><span class="o">.</span>  <span class="n">In</span> <span class="n">fact</span><span class="p">,</span> <span class="n">when</span>
<span class="n">tunneling</span> <span class="kn">from</span> <span class="nn">one</span> <span class="n">machine</span> <span class="n">to</span> <span class="n">another</span> <span class="o">*</span><span class="n">both</span><span class="o">*</span> <span class="n">machines</span> <span class="n">have</span> <span class="nb">open</span>
<span class="n">ports</span> <span class="n">on</span> <span class="n">localhost</span> <span class="n">available</span> <span class="k">for</span> <span class="n">connections</span> <span class="n">to</span> <span class="n">the</span> <span class="n">kernel</span><span class="o">.</span>
</pre></div>
</div>
<p>There are two primary models for using SSH tunnels with Jupyter.  The first
is to have the Kernel listen only on localhost, and connect to it from
another machine on the same LAN.</p>
<p>First, let’s start a kernel on machine <strong>worker</strong>, listening only
on loopback::</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span>user@worker $&gt; ipython kernel
[IPKernelApp] To connect another client to this kernel, use:
[IPKernelApp] --existing kernel-12345.json
</pre></div>
</div>
<p>In this case, the IP that you would connect
to would still be 127.0.0.1, but you want to specify the additional <code class="docutils literal notranslate"><span class="pre">--ssh</span></code> argument
with the hostname of the kernel (in this example, it’s ‘worker’)::</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span>user@client $&gt; jupyter qtconsole  --ssh=worker --existing /path/to/kernel-12345.json
</pre></div>
</div>
<p>Which will write a new connection file with the forwarded ports, so you can reuse them::</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span><span class="p">[</span><span class="n">JupyterQtConsoleApp</span><span class="p">]</span> <span class="n">To</span> <span class="n">connect</span> <span class="n">another</span> <span class="n">client</span> <span class="n">via</span> <span class="n">this</span> <span class="n">tunnel</span><span class="p">,</span> <span class="n">use</span><span class="p">:</span>
<span class="p">[</span><span class="n">JupyterQtConsoleApp</span><span class="p">]</span> <span class="o">--</span><span class="n">existing</span> <span class="n">kernel</span><span class="o">-</span><span class="mi">12345</span><span class="o">-</span><span class="n">ssh</span><span class="o">.</span><span class="n">json</span>
</pre></div>
</div>
<p>Note again that this opens ports on the <em>client</em> machine that point to your kernel.</p>
<p>.. note::</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span>the ssh argument is simply passed to openssh, so it can be fully specified ``user@host:port``
but it will also respect your aliases, etc. in :file:`.ssh/config` if you have any.
</pre></div>
</div>
<p>The second pattern is for connecting to a machine behind a firewall across the internet
(or otherwise wide network). This time, we have a machine <strong>login</strong> that you have ssh access
to, which can see <strong>kernel</strong>, but <strong>client</strong> is on another network. The important difference
now is that <strong>client</strong> can see <strong>login</strong>, but <em>not</em> <strong>worker</strong>. So we need to forward ports from
client to worker <em>via</em> login. This means that the kernel must be started listening
on external interfaces, so that its ports are visible to <code class="docutils literal notranslate"><span class="pre">login</span></code>::</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span>user@worker $&gt; ipython kernel --ip=0.0.0.0
[IPKernelApp] To connect another client to this kernel, use:
[IPKernelApp] --existing kernel-12345.json
</pre></div>
</div>
<p>Which we can connect to from the client with::</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span>user@client $&gt; jupyter qtconsole --ssh=login --ip=192.168.1.123 --existing /path/to/kernel-12345.json
</pre></div>
</div>
<p>.. note::</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span><span class="n">The</span> <span class="n">IP</span> <span class="n">here</span> <span class="ow">is</span> <span class="n">the</span> <span class="n">address</span> <span class="n">of</span> <span class="n">worker</span> <span class="k">as</span> <span class="n">seen</span> <span class="kn">from</span> <span class="o">*</span><span class="n">login</span><span class="o">*</span><span class="p">,</span> <span class="ow">and</span> <span class="n">need</span> <span class="n">only</span> <span class="n">be</span> <span class="n">specified</span> <span class="k">if</span>
<span class="n">the</span> <span class="n">kernel</span> <span class="n">used</span> <span class="n">the</span> <span class="n">ambiguous</span> <span class="mf">0.0.0.0</span> <span class="p">(</span><span class="nb">all</span> <span class="n">interfaces</span><span class="p">)</span> <span class="n">address</span><span class="o">.</span> <span class="n">If</span> <span class="n">it</span> <span class="n">had</span> <span class="n">used</span>
<span class="mf">192.168.1.123</span> <span class="n">to</span> <span class="n">start</span> <span class="k">with</span><span class="p">,</span> <span class="n">it</span> <span class="n">would</span> <span class="ow">not</span> <span class="n">be</span> <span class="n">needed</span><span class="o">.</span>
</pre></div>
</div>
</section>
<section id="manual-ssh-tunnels">
<h2>Manual SSH tunnels<a class="headerlink" href="#manual-ssh-tunnels" title="此标题的永久链接"></a></h2>
<p>It’s possible that Jupyter’s ssh helper functions won’t work for you, for various
reasons.  You can still connect to remote machines, as long as you set up the tunnels
yourself.  The basic format of forwarding a local port to a remote one is::</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span>[client] $&gt; ssh &lt;server&gt; &lt;localport&gt;:&lt;remoteip&gt;:&lt;remoteport&gt; -f -N
</pre></div>
</div>
<p>This will forward local connections to <strong>localport</strong> on client to <strong>remoteip:remoteport</strong>
<em>via</em> <strong>server</strong>. Note that remoteip is interpreted relative to <em>server</em>, not the client.
So if you have direct ssh access to the machine to which you want to forward connections,
then the server <em>is</em> the remote machine, and remoteip should be server’s IP as seen from the
server itself, i.e. 127.0.0.1.  Thus, to forward local port 12345 to remote port 54321 on
a machine you can see, do::</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span>[client] $&gt; ssh machine 12345:127.0.0.1:54321 -f -N
</pre></div>
</div>
<p>But if your target is actually on a LAN at 192.168.1.123, behind another machine called <strong>login</strong>,
then you would do::</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span>[client] $&gt; ssh login 12345:192.168.1.16:54321 -f -N
</pre></div>
</div>
<p>The <code class="docutils literal notranslate"><span class="pre">-f</span> <span class="pre">-N</span></code> on the end are flags that tell ssh to run in the background,
and don’t actually run any commands beyond creating the tunnel.</p>
<p>.. seealso::</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span><span class="n">A</span> <span class="n">short</span> <span class="n">discussion</span> <span class="n">of</span> <span class="n">ssh</span> <span class="n">tunnels</span><span class="p">:</span> <span class="n">http</span><span class="p">:</span><span class="o">//</span><span class="n">www</span><span class="o">.</span><span class="n">revsys</span><span class="o">.</span><span class="n">com</span><span class="o">/</span><span class="n">writings</span><span class="o">/</span><span class="n">quicktips</span><span class="o">/</span><span class="n">ssh</span><span class="o">-</span><span class="n">tunnel</span><span class="o">.</span><span class="n">html</span>
</pre></div>
</div>
</section>
<section id="stopping-kernels-and-consoles">
<h2>Stopping Kernels and Consoles<a class="headerlink" href="#stopping-kernels-and-consoles" title="此标题的永久链接"></a></h2>
<p>Since there can be many consoles per kernel, the shutdown mechanism and dialog
are probably more complicated than you are used to. Since you don’t always want
to shutdown a kernel when you close a window, you are given the option to just
close the console window or also close the Kernel and <em>all other windows</em>. Note
that this only refers to all other <em>local</em> windows, as remote Consoles are not
allowed to shutdown the kernel, and shutdowns do not close Remote consoles (to
allow for saving, etc.).</p>
<p>Rules:</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span><span class="o">*</span> <span class="n">Restarting</span> <span class="n">the</span> <span class="n">kernel</span> <span class="n">automatically</span> <span class="n">clears</span> <span class="nb">all</span> <span class="o">*</span><span class="n">local</span><span class="o">*</span> <span class="n">Consoles</span><span class="p">,</span> <span class="ow">and</span> <span class="n">prompts</span> <span class="n">remote</span>
  <span class="n">Consoles</span> <span class="n">about</span> <span class="n">the</span> <span class="n">reset</span><span class="o">.</span>
<span class="o">*</span> <span class="n">Shutdown</span> <span class="n">closes</span> <span class="nb">all</span> <span class="o">*</span><span class="n">local</span><span class="o">*</span> <span class="n">Consoles</span><span class="p">,</span> <span class="ow">and</span> <span class="n">notifies</span> <span class="n">remotes</span> <span class="n">that</span>
  <span class="n">the</span> <span class="n">Kernel</span> <span class="n">has</span> <span class="n">been</span> <span class="n">shutdown</span><span class="o">.</span>
<span class="o">*</span> <span class="n">Remote</span> <span class="n">Consoles</span> <span class="n">may</span> <span class="ow">not</span> <span class="n">restart</span> <span class="ow">or</span> <span class="n">shutdown</span> <span class="n">the</span> <span class="n">kernel</span><span class="o">.</span>
</pre></div>
</div>
</section>
</section>
<section id="qt-and-the-repl">
<h1>Qt and the REPL<a class="headerlink" href="#qt-and-the-repl" title="此标题的永久链接"></a></h1>
<p>.. note::</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span>This section is relevant regardless of the frontend you use to write Qt
Code. This section is mostly there as it is easy to get confused and assume
that writing Qt code in the QtConsole should change from usual Qt code. It
should not. If you get confused, take a step back, and try writing your
code using the pure terminal based ``jupyter console`` that does not
involve Qt.
</pre></div>
</div>
<p>An important part of working with the REPL – QtConsole, Jupyter notebook,
IPython terminal – when you are writing your own Qt code is to remember that
user code (in the kernel) is <em>not</em> in the same process as the frontend.  This
means that there is not necessarily any Qt code running in the kernel, and
under most normal circumstances there isn’t. This is true even if you are
running the QtConsole.</p>
<p>.. warning::</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span><span class="n">When</span> <span class="n">executing</span> <span class="n">code</span> <span class="kn">from</span> <span class="nn">the</span> <span class="n">qtconsole</span> <span class="n">prompt</span><span class="p">,</span> <span class="n">it</span> <span class="ow">is</span> <span class="o">**</span><span class="ow">not</span> <span class="n">possible</span><span class="o">**</span> <span class="n">to</span>
<span class="n">access</span> <span class="n">the</span> <span class="n">QtApplication</span> <span class="n">instance</span> <span class="n">of</span> <span class="n">the</span> <span class="n">QtConsole</span> <span class="n">itself</span><span class="o">.</span>
</pre></div>
</div>
<p>A common problem listed in the PyQt4 Gotchas_ is the fact that Python’s garbage
collection will destroy Qt objects (Windows, etc.) once there is no longer a
Python reference to them, so you have to hold on to them.  For instance, in:</p>
<p>.. sourcecode:: python</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span><span class="kn">from</span> <span class="nn">PyQt4</span> <span class="kn">import</span> <span class="n">QtGui</span>

<span class="k">def</span> <span class="nf">make_window</span><span class="p">():</span>
    <span class="n">win</span> <span class="o">=</span> <span class="n">QtGui</span><span class="o">.</span><span class="n">QMainWindow</span><span class="p">()</span>

<span class="k">def</span> <span class="nf">make_and_return_window</span><span class="p">():</span>
    <span class="n">win</span> <span class="o">=</span> <span class="n">QtGui</span><span class="o">.</span><span class="n">QMainWindow</span><span class="p">()</span>
    <span class="k">return</span> <span class="n">win</span>
</pre></div>
</div>
<p>:func:<code class="docutils literal notranslate"><span class="pre">make_window</span></code> will never draw a window, because garbage collection will
destroy it before it is drawn, whereas :func:<code class="docutils literal notranslate"><span class="pre">make_and_return_window</span></code> lets the
caller decide when the window object should be destroyed.  If, as a developer,
you know that you always want your objects to last as long as the process, you
can attach them to the <code class="docutils literal notranslate"><span class="pre">QApplication</span></code> instance itself:</p>
<p>.. sourcecode:: python</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span><span class="kn">from</span> <span class="nn">PyQt4</span> <span class="kn">import</span> <span class="n">QtGui</span><span class="p">,</span> <span class="n">QtCore</span>

<span class="c1"># do this just once:</span>
<span class="n">app</span> <span class="o">=</span> <span class="n">QtCore</span><span class="o">.</span><span class="n">QCoreApplication</span><span class="o">.</span><span class="n">instance</span><span class="p">()</span>
<span class="k">if</span> <span class="ow">not</span> <span class="n">app</span><span class="p">:</span>
    <span class="c1"># we are in the kernel in most of the case there is NO qt code running. </span>
    <span class="c1"># we need to create a Gui APP.</span>
    <span class="n">app</span> <span class="o">=</span> <span class="n">QtGui</span><span class="o">.</span><span class="n">QApplication</span><span class="p">([])</span>
<span class="n">app</span><span class="o">.</span><span class="n">references</span> <span class="o">=</span> <span class="nb">set</span><span class="p">()</span>
<span class="c1"># then when you create Windows, add them to the set</span>
<span class="k">def</span> <span class="nf">make_window</span><span class="p">():</span>
    <span class="n">win</span> <span class="o">=</span> <span class="n">QtGui</span><span class="o">.</span><span class="n">QMainWindow</span><span class="p">()</span>
    <span class="n">app</span><span class="o">.</span><span class="n">references</span><span class="o">.</span><span class="n">add</span><span class="p">(</span><span class="n">win</span><span class="p">)</span>
</pre></div>
</div>
<p>Now the <code class="docutils literal notranslate"><span class="pre">QApplication</span></code> itself holds a reference to <code class="docutils literal notranslate"><span class="pre">win</span></code>, so it will never be
garbage collected until the application itself is destroyed.</p>
<p>.. _Gotchas: http://pyqt.sourceforge.net/Docs/PyQt4/gotchas.html#garbage-collection</p>
<section id="embedding-the-qtconsole-in-a-qt-application">
<h2>Embedding the QtConsole in a Qt application<a class="headerlink" href="#embedding-the-qtconsole-in-a-qt-application" title="此标题的永久链接"></a></h2>
<p>There are a few options to integrate the Jupyter Qt console with your own
application:</p>
<ul class="simple">
<li><p>Use :class:<code class="docutils literal notranslate"><span class="pre">qtconsole.rich_jupyter_widget.RichJupyterWidget</span></code> in your
Qt application. This will embed the console widget in your GUI and start the
kernel in a separate process, so code typed into the console cannot access
objects in your application. See :file:<code class="docutils literal notranslate"><span class="pre">examples/embed_qtconsole.py</span></code> for an
example.</p></li>
<li><p>Start an IPython kernel inside a PyQt application (
<code class="docutils literal notranslate"><span class="pre">ipkernel_qtapp.py</span> <span class="pre">&lt;https://github.com/ipython/ipykernel/blob/master/examples/embedding/ipkernel_qtapp.py&gt;</span></code>_
in the <code class="docutils literal notranslate"><span class="pre">ipykernel</span></code> repository shows how to do this). Then launch the Qt
console in a separate process to connect to it. This means that the console
will be in a separate window from your application’s UI, but the code entered
by the user runs in your application.</p></li>
<li><p>Start a special IPython kernel, the
:class:<code class="docutils literal notranslate"><span class="pre">ipykernel.inprocess.ipkernel.InProcessKernel</span></code>, which allows a
QtConsole in the same process. See :file:<code class="docutils literal notranslate"><span class="pre">examples/inprocess_qtconsole.py</span></code>
for an example. This allows both the kernel and the console interface to be
part of your application, but it is not well supported. We encourage you to
use one of the above options instead if you can.</p></li>
</ul>
</section>
</section>
<section id="regressions">
<h1>Regressions<a class="headerlink" href="#regressions" title="此标题的永久链接"></a></h1>
<p>There are some features, where the qt console lags behind the Terminal
frontend:</p>
<ul class="simple">
<li><p>!cmd input: Due to our use of pexpect, we cannot pass input to subprocesses
launched using the ‘!’ escape, so you should never call a command that
requires interactive input.  For such cases, use the terminal IPython.  This
will not be fixed, as abandoning pexpect would significantly degrade the
console experience.</p></li>
</ul>
<p>.. _PyQt: https://www.riverbankcomputing.com/software/pyqt/download
.. _pygments: http://pygments.org/</p>
</section>


           </div>
          </div>
          <footer><div class="rst-footer-buttons" role="navigation" aria-label="页脚">
        <a href="Installation.html" class="btn btn-neutral float-left" title="Installation" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left" aria-hidden="true"></span> 上一页</a>
    </div>

  <hr/>

  
   

</footer>
        </div>
      </div>
    </section>

  {% endraw %}
