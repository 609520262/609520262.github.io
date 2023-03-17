---
title: Troubleshooting
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
      <li>Troubleshooting</li>
      <li class="wy-breadcrumbs-aside">
      </li>
  </ul>
  <hr>
</div>
          <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
           <div itemprop="articleBody">
             
  <section id="troubleshooting">
<span id="toolkit-troubleshooting"></span><h1>Troubleshooting<a class="headerlink" href="#troubleshooting" title="Permalink to this heading"></a></h1>
<p>This document describes common issues and known workarounds or solutions</p>
<section id="conflicting-values-set-for-option-signed-by-error-when-running-apt-update">
<h2>Conflicting values set for option Signed-By error when running <code class="docutils literal notranslate"><span class="pre">apt</span> <span class="pre">update</span></code><a class="headerlink" href="#conflicting-values-set-for-option-signed-by-error-when-running-apt-update" title="Permalink to this heading"></a></h2>
<p>When following the installation instructions on Ubuntu or Debian-based systems and updating the package repository, the following error could be triggered:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell0"><span></span><span class="gp">$ </span>sudo<span class="w"> </span>apt-get<span class="w"> </span>update
<span class="go">E: Conflicting values set for option Signed-By regarding source https://nvidia.github.io/libnvidia-container/stable/ubuntu18.04/amd64/ /: /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg !=</span>
<span class="go">E: The list of sources could not be read.</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell0">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>This is caused by the combination of two things:</p>
<ol class="arabic simple">
<li><p>A recent update to the installation instructions to create a repo list file <code class="docutils literal notranslate"><span class="pre">/etc/apt/sources.list.d/nvidia-container-toolkit.list</span></code></p></li>
<li><p>The deprecation of <code class="docutils literal notranslate"><span class="pre">apt-key</span></code> meaning that the <code class="docutils literal notranslate"><span class="pre">signed-by</span></code> directive is included in the repo list file</p></li>
</ol>
<p>If this error is triggered it means that another reference to the same repository exists that does not specify the <code class="docutils literal notranslate"><span class="pre">signed-by</span></code> directive.
The most likely candidates would be one or more of the files <code class="docutils literal notranslate"><span class="pre">libnvidia-container.list</span></code>, <code class="docutils literal notranslate"><span class="pre">nvidia-docker.list</span></code>, or <code class="docutils literal notranslate"><span class="pre">nvidia-container-runtime.list</span></code> in the
folder <code class="docutils literal notranslate"><span class="pre">/etc/apt/sources.list.d/</span></code>.</p>
<p>The conflicting repository references can be obtained by running and inspecting the output:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell1"><span></span><span class="gp">$ </span>grep<span class="w"> </span><span class="s2">"nvidia.github.io"</span><span class="w"> </span>/etc/apt/sources.list.d/*
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell1">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>The list of files with (possibly)  conflicting references can be optained by running:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell2"><span></span><span class="gp">$ </span>grep<span class="w"> </span>-l<span class="w"> </span><span class="s2">"nvidia.github.io"</span><span class="w"> </span>/etc/apt/sources.list.d/*<span class="w"> </span><span class="p">|</span><span class="w"> </span>grep<span class="w"> </span>-vE<span class="w"> </span><span class="s2">"/nvidia-container-toolkit.list\$"</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell2">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>Deleting the listed files should resolve the original error.</p>
</section>
<section id="permission-denied-error-when-running-the-nvidia-docker-wrapper-under-selinux">
<h2>Permission denied error when running the <code class="docutils literal notranslate"><span class="pre">nvidia-docker</span></code> wrapper under SELinux<a class="headerlink" href="#permission-denied-error-when-running-the-nvidia-docker-wrapper-under-selinux" title="Permalink to this heading"></a></h2>
<p>When running the <code class="docutils literal notranslate"><span class="pre">nvidia-docker</span></code> wrapper (provided by the <code class="docutils literal notranslate"><span class="pre">nvidia-docker2</span></code> package) on SELinux environments
one may see the following error</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell3"><span></span><span class="gp">$ </span>sudo<span class="w"> </span>nvidia-docker<span class="w"> </span>run<span class="w"> </span>--gpus<span class="o">=</span>all<span class="w"> </span>--rm<span class="w"> </span>nvcr.io/nvidia/cuda:11.6.2-base-ubuntu20.04<span class="w"> </span>nvidia-smi
<span class="go">/bin/nvidia-docker: line 34: /bin/docker: Permission denied</span>
<span class="go">/bin/nvidia-docker: line 34: /bin/docker: Success</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell3">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>With SELinux reporting the following error:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell4"><span></span><span class="go">SELinux is preventing /usr/bin/bash from entrypoint access on the file /usr/bin/docker. For complete SELinux messages run: sealert -l 43932883-bf2e-4e4e-800a-80584c62c218</span>
<span class="go">SELinux is preventing /usr/bin/bash from entrypoint access on the file /usr/bin/docker.</span>

<span class="go">*****  Plugin catchall (100. confidence) suggests   **************************</span>

<span class="go">If you believe that bash should be allowed entrypoint access on the docker file by default.</span>
<span class="go">Then you should report this as a bug.</span>
<span class="go">You can generate a local policy module to allow this access.</span>
<span class="go">Do</span>
<span class="go">allow this access for now by executing:</span>
<span class="gp"># </span>ausearch<span class="w"> </span>-c<span class="w"> </span><span class="s1">'nvidia-docker'</span><span class="w"> </span>--raw<span class="w"> </span><span class="p">|</span><span class="w"> </span>audit2allow<span class="w"> </span>-M<span class="w"> </span>my-nvidiadocker
<span class="gp"># </span>semodule<span class="w"> </span>-X<span class="w"> </span><span class="m">300</span><span class="w"> </span>-i<span class="w"> </span>my-nvidiadocker.pp
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell4">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>This occurs because <code class="docutils literal notranslate"><span class="pre">nvidia-docker</span></code> forwards the command line arguments with minor modifications to the <code class="docutils literal notranslate"><span class="pre">docker</span></code> executable.</p>
<p>To address this it is recommeded that the <code class="docutils literal notranslate"><span class="pre">docker</span></code> command be used directly specifying the <code class="docutils literal notranslate"><span class="pre">nvidia</span></code> runtime:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell5"><span></span><span class="gp">$ </span>sudo<span class="w"> </span>docker<span class="w"> </span>run<span class="w"> </span>--gpus<span class="o">=</span>all<span class="w"> </span>--runtime<span class="o">=</span>nvidia<span class="w"> </span>--rm<span class="w"> </span>nvcr.io/nvidia/cuda:11.6.2-base-ubuntu20.04<span class="w"> </span>nvidia-smi
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell5">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>Alternatively a local SELinux policy can be generated as suggested:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell6"><span></span><span class="gp">$ </span>ausearch<span class="w"> </span>-c<span class="w"> </span><span class="s1">'nvidia-docker'</span><span class="w"> </span>--raw<span class="w"> </span><span class="p">|</span><span class="w"> </span>audit2allow<span class="w"> </span>-M<span class="w"> </span>my-nvidiadocker
<span class="gp">$ </span>semodule<span class="w"> </span>-X<span class="w"> </span><span class="m">300</span><span class="w"> </span>-i<span class="w"> </span>my-nvidiadocker.pp
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell6">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
</section>
</section>


           </div>
          </div>
          <footer><div class="rst-footer-buttons" role="navigation" aria-label="Footer">
        <a href="install-guide.html" class="btn btn-neutral float-left" title="Installation Guide" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left" aria-hidden="true"></span> Previous</a>
        <a href="user-guide.html" class="btn btn-neutral float-right" title="User Guide" accesskey="n" rel="next">Next <span class="fa fa-arrow-circle-right" aria-hidden="true"></span></a>
    </div>

  <hr>

  
   

</footer>
        </div>
      </div>
    </section>
    
	
	
	{% endraw %}
