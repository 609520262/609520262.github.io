---
title: Distribution_Entropy
date: 2023-03-08 22:06:47
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
      <li class="breadcrumb-item active">Distribution Entropy</li>
<li class="wy-breadcrumbs-aside">
   <a href="https://github.com/609520262/Deploy-static-content-to-Pages/tree/main/docs/index.rst" class="fa fa-github"> Edit it on GitHub</a>
</li>

  </ul>
  <hr/>
</div>
          <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
           <div itemprop="articleBody">
             
  <section id="distribution-entropy">
<h1>Distribution Entropy<a class="headerlink" href="#distribution-entropy" title="此标题的永久链接"></a></h1>
<section id="id1">
<h2>Basic principle<a class="headerlink" href="#id1" title="此标题的永久链接"></a></h2>
<p>Has a time series <span class="math notranslate nohighlight">\(\left\{{u\left(i \right),1 \le i \le N} \right\}\)</span>of length <span class="math notranslate nohighlight">\(N\)</span> , the distribution entropy is calculated as follows:</p>
<ol class="arabic simple">
<li><p>Phase space reconstruction: We get <span class="math notranslate nohighlight">\(\left({N-m} \right)\)</span> the vector <span class="math notranslate nohighlight">\(X\left( i \right)\)</span></p></li>
</ol>
<div class="math notranslate nohighlight">
\[X\left( i \right) = \left\{ {u\left( i \right),u\left( {i + 1} \right), \cdots ,u\left( {i + m - 1} \right)} \right\},1 \le i \le N - m \tag{1}\]</div>
<ol class="arabic simple" start="2">
<li><p>Distance matrix constructed <span class="math notranslate nohighlight">\({\bf{D}} = \left\{ {{d_{ij}}} \right\}\)</span> : Define the distance <span class="math notranslate nohighlight">\({d_{ij}}\)</span> as the vector <span class="math notranslate nohighlight">\(X\left(i \right)\)</span> and <span class="math notranslate nohighlight">\(X\left(j \right)\)</span> The Chebyshev distance, For any <span class="math notranslate nohighlight">\(i,j\)</span> satisfy <span class="math notranslate nohighlight">\(1 \le i,j \le N-m \)</span>, <span class="math notranslate nohighlight">\({d_{ij}}\)</span> is expressed as:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[{d_{ij}} = \max \left\{ {\left| {u\left( {i + k} \right) - u\left( {j + k} \right)} \right|,0 \le k \le m - 1} \right\} \tag{2}\]</div>
<ol class="arabic simple" start="3">
<li><p>Probability density estimation: The distribution characteristic of all <span class="math notranslate nohighlight">\({d_{ij}}\)</span> is the distance matrix <span class="math notranslate nohighlight">\({\bf{D}}\)</span> Complete quantization of information, The empirical probability density function of <span class="math notranslate nohighlight">\({\bf{D}}\)</span> is estimated by histogram method. Let the histogram have an interval <span class="math notranslate nohighlight">\(M\)</span>, The probability of all <span class="math notranslate nohighlight">\({d_{ij}}\)</span> falling into each interval is denoted as <span class="math notranslate nohighlight">\({p_t},t = 1,2, \cdots ,M\)</span>. To reduce bias, do not count elements of <span class="math notranslate nohighlight">\(i=j\)</span>.</p></li>
<li><p>The distribution entropy can be defined as:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[DistEn\left( {m,M,N} \right) =  - \sum\limits_{t = 1}^M {{p_t}{{\log }_2}({p_t})}    \tag{3}\]</div>
<ol class="arabic simple" start="5">
<li><p>After normalization, the distribution entropy is expressed as</p></li>
</ol>
<div class="math notranslate nohighlight">
\[DistEn\left( {m,M,N} \right) =  - \frac{1}{{{{\log }_2}(M)}}\sum\limits_{t = 1}^M {{p_t}{{\log }_2}({p_t})}  \tag{4}\]</div>
<div class="admonition note">
<p class="admonition-title">remark</p>
<p>The entropy of distribution is proposed by Li et al. <a class="footnote-reference brackets" href="#id9" id="id2">1</a>, and the suggested parameter selection is as follows:</p>
<ul class="simple">
<li><p>Embedding dimension  <span class="math notranslate nohighlight">\(m = 2\)</span>  ,</p></li>
<li><p>Interval number  <span class="math notranslate nohighlight">\(M=512\)</span></p></li>
</ul>
</div>
</section>
<section id="id3">
<h2>Code implementation<a class="headerlink" href="#id3" title="此标题的永久链接"></a></h2>
<p>It is assumed that you have obtained all the code for this project, if you have not obtained the relevant program at this time, please go to  <a class="reference internal" href="../install.html"><span class="doc">Installation instructions</span></a></p>
<p>The core program of Distribution entropy is  <code class="docutils literal notranslate"><span class="pre">DEparameter</span></code></p>
<div class="highlight-c++ notranslate"><div class="highlight"><pre><span></span><span class="n">function</span><span class="w"> </span><span class="p">[</span><span class="n">DE</span><span class="p">]</span><span class="o">=</span><span class="n">DEparameter</span><span class="p">(</span><span class="n">data</span><span class="p">,</span><span class="n">m</span><span class="p">,</span><span class="n">tau</span><span class="p">,</span><span class="n">sigma</span><span class="p">)</span><span class="w">  </span><span class="o">%</span><span class="w"> </span><span class="n">The input time series can be column vectors</span><span class="w"></span>
<span class="w">     </span><span class="p">[</span><span class="n">DE</span><span class="p">]</span><span class="o">=</span><span class="n">diversityEn</span><span class="p">(</span><span class="n">data</span><span class="p">,</span><span class="n">m</span><span class="p">,</span><span class="n">tau</span><span class="p">,</span><span class="n">sigma</span><span class="p">);</span><span class="w">  </span><span class="o">%</span><span class="w"> </span><span class="n">Matrix after adding scale</span><span class="w"> </span><span class="n">Then embed the m dimension</span><span class="p">,</span><span class="n">Find the divergence entropy by steps</span><span class="w"></span>
<span class="n">end</span><span class="w"></span>
</pre></div>
</div>
<div class="admonition important">
<p class="admonition-title">重要</p>
<p>The information of each input parameter is as follows:</p>
<ul class="simple">
<li><p><code class="docutils literal notranslate"><span class="pre">data</span></code>: The input time series is the column vector</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">m</span></code>: Embedding dimension</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">tau</span></code> : Like space reconstruction time step</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">sigma</span></code> : Indicates the number of [-1,1] intervals divided</p></li>
</ul>
</div>
</section>
<section id="id4">
<h2>Simulation verification<a class="headerlink" href="#id4" title="此标题的永久链接"></a></h2>
<section id="id5">
<h3>Pulse detection results of distribution entropy<a class="headerlink" href="#id5" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="Pulse detection results of distribution entropy" src="/assets/Downloads/单尺度脉冲检测结果/DistEn.emf.svg" />
</figure>
</section>
<section id="id6">
<h3>Visual results of fault classification based on multi-scale distributed entropy<a class="headerlink" href="#id6" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="Visual results of fault classification based on multi-scale distributed entropy" src="/assets/Downloads/多尺度可视化结果/MultiDistEn.emf.svg" />
</figure>
</section>
<section id="id7">
<h3>Noise resistance analysis<a class="headerlink" href="#id7" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="Noise resistance analysis" src="/assets/Downloads/抗噪性结果/DistEn.emf.svg" />
</figure>
</section>
<section id="id8">
<h3>Computational efficiency result<a class="headerlink" href="#id8" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="Computational efficiency result" src="/assets/Downloads/计算效率结果/DistEn.emf.svg" />
</figure>
<dl class="footnote brackets">
<dt class="label" id="id9"><span class="brackets"><a class="fn-backref" href="#id2">1</a></span></dt>
<dd><ol class="upperalpha simple" start="16">
<li><p>Li, C. Liu, K. Li, D. Zheng, C. Liu, and Y. Hou, “Assessing the complexity of short-term heartbeat interval series by distribution entropy,” Med. Biol. Eng. Comput., vol. 53, no. 1, pp. 77–87, Jan. 2015, doi: 10.1007/s11517-014-1216-0.</p></li>
</ol>
</dd>
</dl>
</section>
</section>
</section>


           </div>
          </div>
          <footer><div class="rst-footer-buttons" role="navigation" aria-label="页脚">
        <a href="5%20Diversity%20Entropy.html" class="btn btn-neutral float-left" title="散度熵(Diversity Entropy)" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left" aria-hidden="true"></span> 上一页</a>
        <a href="7%20Symbolic%20dynamic%20Entropy.html" class="btn btn-neutral float-right" title="符号动力学熵(Symbolic dynamic Entropy)" accesskey="n" rel="next">下一页 <span class="fa fa-arrow-circle-right" aria-hidden="true"></span></a>
    </div>

  <hr/>

 
   

</footer>
        </div>
      </div>
    </section>

{% endraw %}