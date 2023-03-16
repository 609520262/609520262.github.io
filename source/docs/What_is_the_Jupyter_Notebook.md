---
title: What is the Jupyter Notebook?
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
      <li class="breadcrumb-item active">What is the Jupyter Notebook?</li>
<li class="wy-breadcrumbs-aside">
   <a href="https://github.com/609520262/Deploy-static-content-to-Pages/tree/main/docs/index.rst" class="fa fa-github"> 在 GitHub 上编辑</a>
</li>

  </ul>
  <hr/>
</div>
          <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
           <div itemprop="articleBody">
             
  <section id="what-is-the-jupyter-notebook">
<span id="what-is-jupyther"></span><h1><a class="toc-backref" href="#id5" role="doc-backlink">What is the Jupyter Notebook?</a><a class="headerlink" href="#what-is-the-jupyter-notebook" title="此标题的永久链接"></a></h1>
<p>In this page briefly introduce the main components of the <em>Jupyter Notebook</em>
environment. For a more complete overview see <a class="reference internal" href="#references"><span class="std std-ref">References</span></a>.</p>
<nav class="contents" id="id1">
<p class="topic-title">目录</p>
<ul class="simple">
<li><p><a class="reference internal" href="#what-is-the-jupyter-notebook" id="id5">What is the Jupyter Notebook?</a></p>
<ul>
<li><p><a class="reference internal" href="#notebook-document" id="id6">Notebook document</a></p></li>
<li><p><a class="reference internal" href="#jupyter-notebook-app" id="id7">Jupyter Notebook App</a></p></li>
<li><p><a class="reference internal" href="#kernel" id="id8">kernel</a></p></li>
<li><p><a class="reference internal" href="#notebook-dashboard" id="id9">Notebook Dashboard</a></p></li>
<li><p><a class="reference internal" href="#references" id="id10">References</a></p></li>
</ul>
</li>
</ul>
</nav>
<section id="notebook-document">
<span id="id2"></span><h2><a class="toc-backref" href="#id6" role="doc-backlink">Notebook document</a><a class="headerlink" href="#notebook-document" title="此标题的永久链接"></a></h2>
<p>Notebook documents (or “notebooks”, all lower case) are documents
produced by the <a class="reference internal" href="#notebook-app"><span class="std std-ref">Jupyter Notebook App</span></a>, which contain both computer code (e.g. python)
and rich text elements (paragraph, equations, figures, links, etc…).
Notebook documents are both human-readable documents containing the analysis
description and the results (figures, tables, etc..) as well as executable documents
which can be run to perform data analysis.</p>
<p><strong>References</strong>: Notebook documents <a class="reference external" href="http://ipython.org/notebook.html#notebook-documents">in the project homepage</a> and <a class="reference external" href="http://jupyter-notebook.readthedocs.org/en/latest/notebook.html#notebook-documents">in the official docs</a>.</p>
</section>
<section id="jupyter-notebook-app">
<span id="notebook-app"></span><h2><a class="toc-backref" href="#id7" role="doc-backlink">Jupyter Notebook App</a><a class="headerlink" href="#jupyter-notebook-app" title="此标题的永久链接"></a></h2>
<p>The <em>Jupyter Notebook App</em> is a server-client application that allows
editing and running <a class="reference internal" href="#notebook-document"><span class="std std-ref">notebook documents</span></a>
via a web browser.
The <em>Jupyter Notebook App</em> can be executed on a local desktop
requiring no internet access (as described in this document)
or can be installed on a remote server and accessed through the internet.</p>
<p>In addition to displaying/editing/running notebook documents,
the <em>Jupyter Notebook App</em> has a “Dashboard” (<a class="reference internal" href="#dashboard"><span class="std std-ref">Notebook Dashboard</span></a>),
a “control panel” showing local files and allowing to
open notebook documents or shutting down their <a class="reference internal" href="#kernel"><span class="std std-ref">kernels</span></a>.</p>
<p><strong>References</strong>: Jupyter Notebook App
<a class="reference external" href="http://ipython.org/notebook.html">in the project homepage</a> and
<a class="reference external" href="http://jupyter-notebook.readthedocs.org/">in the official docs</a>.</p>
</section>
<section id="kernel">
<span id="id3"></span><h2><a class="toc-backref" href="#id8" role="doc-backlink">kernel</a><a class="headerlink" href="#kernel" title="此标题的永久链接"></a></h2>
<p>A notebook <em>kernel</em> is a “computational engine”
that executes the code contained in a <a class="reference internal" href="#notebook-document"><span class="std std-ref">Notebook document</span></a>.
The <em>ipython kernel</em>, referenced in this guide, executes python code.
Kernels for many other languages exist
(<a class="reference external" href="http://jupyter.readthedocs.org/en/latest/#kernels">official kernels</a>).</p>
<p>When you open a <a class="reference internal" href="#notebook-document"><span class="std std-ref">Notebook document</span></a>, the associated <em>kernel</em> is automatically launched.
When the notebook is <em>executed</em> (either cell-by-cell or with menu <em>Cell -&gt; Run All</em>),
the <em>kernel</em> performs the computation and produces the results.
Depending on the type of computations, the <em>kernel</em> may consume significant
CPU and RAM. Note that the RAM is not released until the <em>kernel</em> is shut-down.</p>
<p>See also <a class="reference internal" href="execute.html#kernel-shutdown"><span class="std std-ref">Close a notebook: kernel shut down</span></a>.</p>
<p><strong>References</strong>: from the official docs
<a class="reference external" href="http://jupyter-notebook.readthedocs.org/en/latest/notebook.html#opening-notebooks">Opening Notebooks</a> and
<a class="reference external" href="http://ipython.org/ipython-doc/stable/overview.html#ipythonzmq">Decoupled two-process model</a>.</p>
</section>
<section id="notebook-dashboard">
<span id="dashboard"></span><h2><a class="toc-backref" href="#id9" role="doc-backlink">Notebook Dashboard</a><a class="headerlink" href="#notebook-dashboard" title="此标题的永久链接"></a></h2>
<p>The <em>Notebook Dashboard</em> is the component which
is shown first when you launch <a class="reference internal" href="#notebook-app"><span class="std std-ref">Jupyter Notebook App</span></a>.
The <em>Notebook Dashboard</em> is mainly used to open <a class="reference internal" href="#notebook-document"><span class="std std-ref">notebook documents</span></a>,
and to manage the running <a class="reference internal" href="#kernel"><span class="std std-ref">kernels</span></a> (visualize and shutdown).</p>
<p>The <em>Notebook Dashboard</em> has other features similar to a file manager, namely
navigating folders and renaming/deleting files.</p>
<p><strong>References</strong>: from the official docs
<a class="reference external" href="http://jupyter-notebook.readthedocs.org/en/latest/notebook.html#opening-notebooks">Opening Notebooks</a>.</p>
</section>
<section id="references">
<span id="id4"></span><h2><a class="toc-backref" href="#id10" role="doc-backlink">References</a><a class="headerlink" href="#references" title="此标题的永久链接"></a></h2>
<p>Official Jupyter Project Pages:</p>
<ul class="simple">
<li><p><a class="reference external" href="https://jupyter.org/">Project Jupyter Homepage</a></p></li>
<li><p><a class="reference external" href="http://ipython.org/notebook.html">Old IPython Notebook Homepage</a></p></li>
</ul>
<p>Official Documentation:</p>
<ul class="simple">
<li><p><a class="reference external" href="http://jupyter-notebook.readthedocs.org/">Jupyter Notebook Documentation</a></p></li>
<li><p><a class="reference external" href="http://jupyter.readthedocs.org/">Jupyter Project Documentation</a></p></li>
</ul>
<p>See also:</p>
<ul class="simple">
<li><p><a class="reference external" href="http://nbviewer.jupyter.org/github/jupyter/notebook/blob/master/docs/source/examples/Notebook/What%20is%20the%20Jupyter%20Notebook.ipynb#">What is the IPython Notebook?</a></p></li>
<li><p><a class="reference external" href="http://nbviewer.jupyter.org/github/jupyter/notebook/blob/master/docs/source/examples/Notebook/Notebook%20Basics.ipynb">Notebook Basics</a>, an example notebook</p></li>
<li><p><a class="reference external" href="http://opentechschool.github.io/python-data-intro/core/notebook.html">Introducing IPython Notebook</a></p></li>
<li><p><a class="reference external" href="https://www.datacamp.com/community/tutorials/tutorial-jupyter-notebook">Jupyter Notebook: The Definitive Guide</a>, an introductory tutorial to Jupyter</p></li>
</ul>
<hr class="docutils" />
<p>The <em>Next</em> button will bring you to the next section (<em>Installation</em>).</p>
</section>
</section>


           </div>
          </div>
          <footer><div class="rst-footer-buttons" role="navigation" aria-label="页脚">
        <a href="install.html" class="btn btn-neutral float-left" title="Installation" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left" aria-hidden="true"></span> 上一页</a>
    </div>

  <hr/>

  
   

</footer>
        </div>
      </div>
    </section>

  {% endraw %}
