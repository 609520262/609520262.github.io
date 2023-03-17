---
title: Concepts
date: 2023-03-08 20:35:48
---

{% raw %}


 <section data-toggle="wy-nav-shift" class="wy-nav-content-wrap"><nav class="wy-nav-top" aria-label="Mobile navigation menu">
          <i data-toggle="wy-nav-top" class="fa fa-bars"></i>
          <a href="../contents.html">NVIDIA Cloud Native Technologies</a>
      </nav>

      <div class="wy-nav-content">
        <div class="rst-content">
          <div role="navigation" aria-label="Page navigation">
  <ul class="wy-breadcrumbs">
      <li><a href="../contents.html" class="icon icon-home"></a> »</li>
      <li>Concepts</li>
      <li class="wy-breadcrumbs-aside">
      </li>
  </ul>
  <hr>
</div>
          <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
           <div itemprop="articleBody">
             
  <section id="concepts">
<span id="id1"></span><h1>Concepts<a class="headerlink" href="#concepts" title="Permalink to this heading"></a></h1>
<section id="what-is-docker">
<h2>What is Docker?<a class="headerlink" href="#what-is-docker" title="Permalink to this heading"></a></h2>
<p>From the official <a class="reference external" href="https://www.docker.com/what-docker">Docker pages</a>:</p>
<div class="highlight-default notranslate"><div class="highlight"><pre id="codecell0"><span></span>Docker containers wrap a piece of software in a complete filesystem that contains everything needed to run: code,
runtime, system tools, system libraries – anything that can be installed on a server. This guarantees that the software
will always run the same, regardless of its environment.
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell0">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>More high-level information about Docker can be found on the Moby project <a class="reference external" href="https://github.com/moby/moby/blob/master/README.md">README</a>.
Technical documentation can be found on the Docker documentation <a class="reference external" href="https://docs.docker.com/">repository</a>.</p>
</section>
<section id="motivation">
<h2>Motivation<a class="headerlink" href="#motivation" title="Permalink to this heading"></a></h2>
<section id="benefits-of-gpu-containerization">
<h3>Benefits of GPU containerization<a class="headerlink" href="#benefits-of-gpu-containerization" title="Permalink to this heading"></a></h3>
<p>Containerizing GPU applications provides several benefits, among them:</p>
<ul class="simple">
<li><p>Ease of deployment</p></li>
<li><p>Isolation of individual devices</p></li>
<li><p>Run across heterogeneous driver/toolkit environments</p></li>
<li><p>Requires only the NVIDIA driver to be installed on the host</p></li>
<li><p>Facilitate collaboration: reproducible builds, reproducible performance, reproducible results.</p></li>
</ul>
</section>
<section id="background">
<h3>Background<a class="headerlink" href="#background" title="Permalink to this heading"></a></h3>
<p>Docker® containers are often used to seamlessly deploy CPU-based applications on multiple machines. With this use case, containers
are both hardware-agnostic and platform-agnostic. This is obviously not the case when using NVIDIA GPUs since it is using specialized
hardware and it requires the installation of the NVIDIA driver. As a result, Docker Engine does not natively support NVIDIA GPUs with containers.</p>
<p>To solve this problem, one of the early solutions that emerged was to fully reinstall the NVIDIA driver inside the container and then pass the
character devices corresponding to the NVIDIA GPUs (e.g. <code class="docutils literal notranslate"><span class="pre">/dev/nvidia0</span></code>) when starting the container. However, this solution was brittle: the version of
the host driver had to exactly match driver version installed in the container. The Docker images could not be shared and had to be built locally
on each machine, defeating one of the main advantages of Docker.</p>
<p>To make the Docker images portable while still leveraging NVIDIA GPUs, the container images must be agnostic of the NVIDIA driver.
The NVIDIA Container Toolkit provides utilities to enable GPU support inside the container runtime.</p>
</section>
</section>
</section>


           </div>
          </div>
          <footer><div class="rst-footer-buttons" role="navigation" aria-label="Footer">
        <a href="overview.html" class="btn btn-neutral float-left" title="Overview" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left" aria-hidden="true"></span> Previous</a>
        <a href="arch-overview.html" class="btn btn-neutral float-right" title="Architecture Overview" accesskey="n" rel="next">Next <span class="fa fa-arrow-circle-right" aria-hidden="true"></span></a>
    </div>

  <hr>

  

</footer>
        </div>
      </div>
    </section>
    
	
	
	{% endraw %}
