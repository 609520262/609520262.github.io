---
title: Running the Jupyter Notebook
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
      <li class="breadcrumb-item active">Running the Jupyter Notebook</li>
<li class="wy-breadcrumbs-aside">
   <a href="https://github.com/609520262/Deploy-static-content-to-Pages/tree/main/docs/index.rst" class="fa fa-github"> 在 GitHub 上编辑</a>
</li>

  </ul>
  <hr/>
</div>
          <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
           <div itemprop="articleBody">
             
  <section id="running-the-jupyter-notebook">
<h1>Running the Jupyter Notebook<a class="headerlink" href="#running-the-jupyter-notebook" title="此标题的永久链接"></a></h1>
<section id="launching-jupyter-notebook-app">
<span id="launching-notebook"></span><h2>Launching <em>Jupyter Notebook App</em><a class="headerlink" href="#launching-jupyter-notebook-app" title="此标题的永久链接"></a></h2>
<p>The <a class="reference internal" href="quick%20start.html#notebook-app"><span class="std std-ref">Jupyter Notebook App</span></a> can be launched by clicking on the <em>Jupyter Notebook</em>
icon installed by Anaconda in the start menu (Windows) or by typing in
a terminal (<em>cmd</em> on Windows):</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span><span class="n">jupyter</span> <span class="n">notebook</span>
</pre></div>
</div>
<p>This will launch a new browser window (or a new tab) showing the
<a class="reference internal" href="quick%20start.html#dashboard"><span class="std std-ref">Notebook Dashboard</span></a>, a sort of control panel that allows (among other things)
to select which notebook to open.</p>
<p>When started, the <a class="reference internal" href="quick%20start.html#notebook-app"><span class="std std-ref">Jupyter Notebook App</span></a> can access only files within its start-up folder
(including any sub-folder). No configuration is necessary if you place your notebooks
in your home folder or subfolders.
Otherwise, you need to choose a <a class="reference internal" href="quick%20start.html#notebook-app"><span class="std std-ref">Jupyter Notebook App</span></a> start-up folder which will contain
all the notebooks.</p>
<p>See below for platform-specific instructions on how to start
<a class="reference internal" href="quick%20start.html#notebook-app"><span class="std std-ref">Jupyter Notebook App</span></a> in a specific folder.</p>
<section id="change-jupyter-notebook-startup-folder-windows">
<h3>Change Jupyter Notebook startup folder (Windows)<a class="headerlink" href="#change-jupyter-notebook-startup-folder-windows" title="此标题的永久链接"></a></h3>
<ul class="simple">
<li><p>Copy the <em>Jupyter Notebook</em> launcher from the menu to the desktop.</p></li>
<li><p>Right click on the new launcher and change the <cite>Target field</cite>, change <em>%USERPROFILE%</em> to
the full path of the folder which will contain all the notebooks.</p></li>
<li><p>Double-click on the <em>Jupyter Notebook</em> desktop launcher (icon shows [IPy]) to start the
<a class="reference internal" href="quick%20start.html#notebook-app"><span class="std std-ref">Jupyter Notebook App</span></a>. The notebook interface will appear in a new browser window or tab.
A secondary terminal window (used only for error logging and
for shut down) will be also opened.</p></li>
</ul>
</section>
<section id="change-jupyter-notebook-startup-folder-mac-os">
<h3>Change Jupyter Notebook startup folder (Mac OS)<a class="headerlink" href="#change-jupyter-notebook-startup-folder-mac-os" title="此标题的永久链接"></a></h3>
<p>To launch <a class="reference internal" href="quick%20start.html#notebook-app"><span class="std std-ref">Jupyter Notebook App</span></a>:</p>
<ul class="simple">
<li><p>Click on spotlight, type <code class="docutils literal notranslate"><span class="pre">terminal</span></code> to open a terminal window.</p></li>
<li><p>Enter the startup folder by typing <code class="docutils literal notranslate"><span class="pre">cd</span> <span class="pre">/some_folder_name</span></code>.</p></li>
<li><p>Type <code class="docutils literal notranslate"><span class="pre">jupyter</span> <span class="pre">notebook</span></code> to launch the <a class="reference internal" href="quick%20start.html#notebook-app"><span class="std std-ref">Jupyter Notebook App</span></a>
The notebook interface will appear in a new browser window or tab.</p></li>
</ul>
</section>
</section>
<section id="shut-down-the-jupyter-notebook-app">
<h2>Shut down the <em>Jupyter Notebook App</em><a class="headerlink" href="#shut-down-the-jupyter-notebook-app" title="此标题的永久链接"></a></h2>
<p>Closing the browser (or the tab) <strong>will not close</strong> the
<a class="reference internal" href="quick%20start.html#notebook-app"><span class="std std-ref">Jupyter Notebook App</span></a>. To completely shut it down you need to
<strong>close the associated terminal</strong>.</p>
<p>In more detail,
the <a class="reference internal" href="quick%20start.html#notebook-app"><span class="std std-ref">Jupyter Notebook App</span></a> is a server that appears in your browser
at a default address (<em>http://localhost:8888</em>).
Closing the browser will not shut down the server.
You can reopen the previous address
and the <a class="reference internal" href="quick%20start.html#notebook-app"><span class="std std-ref">Jupyter Notebook App</span></a> will be redisplayed.</p>
<p>You can run many copies of the <a class="reference internal" href="quick%20start.html#notebook-app"><span class="std std-ref">Jupyter Notebook App</span></a> and they will show
up at a similar address (only the number after “:”, which is the port,
will increment for each new copy).
Since with a single <a class="reference internal" href="quick%20start.html#notebook-app"><span class="std std-ref">Jupyter Notebook App</span></a> you can already open many notebooks,
we do not recommend running multiple copies of <a class="reference internal" href="quick%20start.html#notebook-app"><span class="std std-ref">Jupyter Notebook App</span></a>.</p>
</section>
<section id="close-a-notebook-kernel-shut-down">
<span id="kernel-shutdown"></span><h2>Close a notebook: <em>kernel</em> shut down<a class="headerlink" href="#close-a-notebook-kernel-shut-down" title="此标题的永久链接"></a></h2>
<p>When a notebook is opened, its “computational engine” (called the <a class="reference internal" href="quick%20start.html#kernel"><span class="std std-ref">kernel</span></a>)
is automatically started.
Closing the notebook browser tab, will not shut down the <a class="reference internal" href="quick%20start.html#kernel"><span class="std std-ref">kernel</span></a>,
instead the kernel will keep running until is explicitly shut down.</p>
<p>To shut down a kernel, go to the associated notebook
and click on menu <em>File</em> -&gt; <em>Close and Halt</em>. Alternatively, the <a class="reference internal" href="quick%20start.html#dashboard"><span class="std std-ref">Notebook Dashboard</span></a>
has a tab named <em>Running</em> that shows all the running notebooks (i.e. kernels)
and allows shutting them down (by clicking on a <em>Shutdown</em> button).</p>
</section>
<section id="executing-a-notebook">
<h2>Executing a notebook<a class="headerlink" href="#executing-a-notebook" title="此标题的永久链接"></a></h2>
<p>Download the notebook you want to execute and put it in your
notebook folder (or a sub-folder of it).</p>
<p>Then follow these steps:</p>
<ul class="simple">
<li><p>Launch the <a class="reference internal" href="quick%20start.html#notebook-app"><span class="std std-ref">Jupyter Notebook App</span></a> (see <a class="reference internal" href="#launching-notebook"><span class="std std-ref">previous section</span></a>).</p></li>
<li><p>In the <a class="reference internal" href="quick%20start.html#dashboard"><span class="std std-ref">Notebook Dashboard</span></a> navigate to find the notebook:
clicking on its name will open it in a new browser tab.</p></li>
<li><p>Click on the menu <em>Help -&gt; User Interface Tour</em> for an overview
of the <a class="reference internal" href="quick%20start.html#notebook-app"><span class="std std-ref">Jupyter Notebook App</span></a> user interface.</p></li>
<li><p>You can run the notebook document step-by-step (one cell a time) by pressing
<em>shift + enter</em>.</p></li>
<li><p>You can run the whole notebook in a single step by clicking on the menu
<em>Cell -&gt; Run All</em>.</p></li>
<li><p>To restart the <a class="reference internal" href="quick%20start.html#kernel"><span class="std std-ref">kernel</span></a> (i.e. the computational engine), click on the menu
<em>Kernel -&gt; Restart</em>. This can be useful to start over a computation from
scratch (e.g. variables are deleted, open files are closed, etc…).</p></li>
</ul>
<p>More information on editing a notebook:</p>
<ul class="simple">
<li><p><a class="reference external" href="http://nbviewer.jupyter.org/github/jupyter/notebook/blob/master/docs/source/examples/Notebook/Notebook%20Basics.ipynb">Notebook Basics</a>
(or <a class="reference external" href="https://github.com/jupyter/notebook/blob/master/docs/source/examples/Notebook/Notebook%20Basics.ipynb">alternate link</a>)</p></li>
</ul>
<div class="admonition note">
<p class="admonition-title">备注</p>
<p><strong>Save notebooks</strong>: modifications to the notebooks are automatically saved every
few minutes. To avoid modifying the original notebook, make a
copy of the notebook document (menu <em>File -&gt; Make a copy …</em>) and
save the modifications on the copy.</p>
</div>
<div class="admonition warning">
<p class="admonition-title">警告</p>
<p>Pay attention to not open the <strong>same</strong> notebook document
on <strong>many tabs</strong>: edits on different tabs can overwrite each other!
To be safe, make sure you open each notebook document in only one tab.
If you accidentally open a notebook twice in two different tabs, just
close one of the tabs.</p>
</div>
<p>More info on the <a class="reference internal" href="quick%20start.html#notebook-app"><span class="std std-ref">Jupyter Notebook App</span></a> environment see <a class="reference internal" href="quick%20start.html#references"><span class="std std-ref">References</span></a>.</p>
</section>
</section>


           </div>
          </div>
          <footer><div class="rst-footer-buttons" role="navigation" aria-label="页脚">
        <a href="../about_us.html" class="btn btn-neutral float-left" title="关于IMLAB" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left" aria-hidden="true"></span> 上一页</a>
        <a href="install.html" class="btn btn-neutral float-right" title="Installation" accesskey="n" rel="next">下一页 <span class="fa fa-arrow-circle-right" aria-hidden="true"></span></a>
    </div>

  <hr/>

  

</footer>
        </div>
      </div>
    </section>


  {% endraw %}
