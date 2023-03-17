---
title: quick_start
date: 2023-03-08 20:35:48
---

{% raw %}


  <section data-toggle="wy-nav-shift" class="wy-nav-content-wrap">

      
      <nav class="wy-nav-top" aria-label="top navigation">
        
          <i data-toggle="wy-nav-top" class="fa fa-bars"></i>
          <a href="../index.html">PaddleClas</a>
        
      </nav>


      <div class="wy-nav-content">
        
        <div class="rst-content">
        
          















<div role="navigation" aria-label="breadcrumbs navigation">

  <ul class="wy-breadcrumbs">
    
      <li><a href="../index.html">Docs</a> »</li>
        
          <li><a href="index.html">初级使用</a> »</li>
        
      <li>安装说明</li>
    
    
      <li class="wy-breadcrumbs-aside">
        
            
            
              <a href="https://github.com/PaddlePaddle/PaddleClas/blob/master/docs/zh_CN/tutorials/install.md" class="fa fa-github"> Edit on GitHub</a>
            
          
        
      </li>
    
  </ul>

  
  <hr>
</div>
          <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
           <div itemprop="articleBody">
            
  <div class="section" id="id1">
<h1>安装说明<a class="headerlink" href="#id1" title="永久链接至标题">¶</a></h1>
<hr class="docutils">
<div class="section" id="id2">
<h2>一、简介<a class="headerlink" href="#id2" title="永久链接至标题">¶</a></h2>
<p>本章将介绍如何安装PaddleClas及其依赖项。</p>
</div>
<div class="section" id="paddlepaddle">
<h2>二、安装PaddlePaddle<a class="headerlink" href="#paddlepaddle" title="永久链接至标题">¶</a></h2>
<p>运行PaddleClas需要PaddlePaddle Fluid v1.7或更高版本。请参照<a class="reference external" href="http://www.paddlepaddle.org.cn/install/quick">安装文档</a>中的说明进行操作。</p>
<p>如果已经安装好了cuda、cudnn、nccl或者安装好了docker、nvidia-docker运行环境，可以pip安装最新GPU版本PaddlePaddle</p>
<div class="highlight-bash notranslate"><div class="highlight"><pre><span></span>pip install paddlepaddle-gpu --upgrade
</pre></div>
</div>
<p>也可以从源码编译安装PaddlePaddle，请参照<a class="reference external" href="http://www.paddlepaddle.org.cn/install/quick">安装文档</a>中的说明进行操作。</p>
<p>使用以下命令可以验证PaddlePaddle是否安装成功。</p>
<div class="highlight-python notranslate"><div class="highlight"><pre><span></span><span class="kn">import</span> <span class="nn">paddle.fluid</span> <span class="kn">as</span> <span class="nn">fluid</span>
<span class="n">fluid</span><span class="o">.</span><span class="n">install_check</span><span class="o">.</span><span class="n">run_check</span><span class="p">()</span>
</pre></div>
</div>
<p>查看PaddlePaddle版本的命令如下：</p>
<div class="highlight-bash notranslate"><div class="highlight"><pre><span></span>python -c <span class="s2">"import paddle; print(paddle.__version__)"</span>
</pre></div>
</div>
<p>注意：</p>
<ul class="simple">
<li>从源码编译的PaddlePaddle版本号为0.0.0，请确保使用了Fluid v1.7之后的源码编译。</li>
<li>PaddleClas基于PaddlePaddle高性能的分布式训练能力，若您从源码编译，请确保打开编译选项，<strong>WITH_DISTRIBUTE=ON</strong>。具体编译选项参考<a class="reference external" href="https://www.paddlepaddle.org.cn/documentation/docs/zh/develop/install/Tables.html#id3">编译选项表</a></li>
</ul>
<p><strong>运行环境需求:</strong></p>
<ul class="simple">
<li>Python3 (当前只支持Linux系统)</li>
<li>CUDA &gt;= 9.0</li>
<li>cuDNN &gt;= 5.0</li>
<li>nccl &gt;= 2.1.2</li>
</ul>
</div>
<div class="section" id="paddleclas">
<h2>三、安装PaddleClas<a class="headerlink" href="#paddleclas" title="永久链接至标题">¶</a></h2>
<p><strong>克隆PaddleClas模型库：</strong></p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span><span class="n">cd</span> <span class="n">path_to_clone_PaddleClas</span>
<span class="n">git</span> <span class="n">clone</span> <span class="n">https</span><span class="p">:</span><span class="o">//</span><span class="n">github</span><span class="o">.</span><span class="n">com</span><span class="o">/</span><span class="n">PaddlePaddle</span><span class="o">/</span><span class="n">PaddleClas</span><span class="o">.</span><span class="n">git</span>
</pre></div>
</div>
<p><strong>安装Python依赖库：</strong></p>
<p>Python依赖库在<a class="reference external" href="https://github.com/PaddlePaddle/PaddleClas/blob/master/requirements.txt">requirements.txt</a>中给出，可通过如下命令安装：</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span><span class="n">pip</span> <span class="n">install</span> <span class="o">--</span><span class="n">upgrade</span> <span class="o">-</span><span class="n">r</span> <span class="n">requirements</span><span class="o">.</span><span class="n">txt</span>
</pre></div>
</div>
<p>visualdl可能出现安装失败，请尝试</p>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span><span class="n">pip3</span> <span class="n">install</span> <span class="o">--</span><span class="n">upgrade</span> <span class="n">visualdl</span><span class="o">==</span><span class="mf">2.0</span><span class="o">.</span><span class="mi">0</span><span class="n">b3</span> <span class="o">-</span><span class="n">i</span> <span class="n">https</span><span class="p">:</span><span class="o">//</span><span class="n">mirror</span><span class="o">.</span><span class="n">baidu</span><span class="o">.</span><span class="n">com</span><span class="o">/</span><span class="n">pypi</span><span class="o">/</span><span class="n">simple</span>
</pre></div>
</div>
</div>
</div>


           </div>
           
          </div>
          <footer>
  
    <div class="rst-footer-buttons" role="navigation" aria-label="footer navigation">
      
        <a href="quick_start.html" class="btn btn-neutral float-right" title="30分钟玩转PaddleClas" accesskey="n" rel="next">Next <span class="fa fa-arrow-circle-right"></span></a>
      
      
        <a href="index.html" class="btn btn-neutral float-left" title="初级使用" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left"></span> Previous</a>
      
    </div>
  

  <hr><div><div id="rtd-sidebar" data-ea-publisher="readthedocs" data-ea-type="readthedocs-sidebar" data-ea-manual="true" class="ethical-rtd" data-ea-keywords="only words|paddleclas|readthedocs-project-593273|readthedocs-project-paddleclas" data-ea-campaign-types="community|house|paid"></div></div>

 
</footer>

        </div>
      </div>

    </section>
    
	
	
	{% endraw %}
