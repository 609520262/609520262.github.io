---
title: Diversity_Entropy
date: 2023-03-08 22:06:00
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
      <li class="breadcrumb-item active">分布熵(Distribution Entropy)</li>
<li class="wy-breadcrumbs-aside">
   <a href="https://github.com/609520262/Deploy-static-content-to-Pages/tree/main/docs/index.rst" class="fa fa-github"> 在 GitHub 上编辑</a>
</li>

  </ul>
  <hr/>
</div>
          <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
           <div itemprop="articleBody">
             
  <section id="distribution-entropy">
<h1>分布熵(Distribution Entropy)<a class="headerlink" href="#distribution-entropy" title="此标题的永久链接"></a></h1>
<section id="id1">
<h2>基本原理<a class="headerlink" href="#id1" title="此标题的永久链接"></a></h2>
<p>设有长度为  <span class="math notranslate nohighlight">\(N\)</span> 的时间序列  <span class="math notranslate nohighlight">\(\left\{ {u\left( i \right),1 \le i \le N} \right\}\)</span> ，分布熵的计算步骤如下：</p>
<ol class="arabic simple">
<li><p>相空间重构：可以得到  <span class="math notranslate nohighlight">\(\left( {N - m} \right)\)</span> 个向量 <span class="math notranslate nohighlight">\(X\left( i \right)\)</span></p></li>
</ol>
<div class="math notranslate nohighlight">
\[X\left( i \right) = \left\{ {u\left( i \right),u\left( {i + 1} \right), \cdots ,u\left( {i + m - 1} \right)} \right\},1 \le i \le N - m \tag{1}\]</div>
<ol class="arabic simple" start="2">
<li><p>构造距离矩阵 <span class="math notranslate nohighlight">\({\bf{D}} = \left\{ {{d_{ij}}} \right\}\)</span> ：定义距离 <span class="math notranslate nohighlight">\({d_{ij}}\)</span> 为向量  <span class="math notranslate nohighlight">\(X\left( i \right)\)</span> 和 <span class="math notranslate nohighlight">\(X\left( j \right)\)</span> 的切比雪夫距离，对于任意 <span class="math notranslate nohighlight">\(i,j\)</span> 满足  <span class="math notranslate nohighlight">\(1 \le i,j \le N - m\)</span> ， <span class="math notranslate nohighlight">\({d_{ij}}\)</span>  表示为:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[{d_{ij}} = \max \left\{ {\left| {u\left( {i + k} \right) - u\left( {j + k} \right)} \right|,0 \le k \le m - 1} \right\} \tag{2}\]</div>
<ol class="arabic simple" start="3">
<li><p>概率密度估计：所有 <span class="math notranslate nohighlight">\({d_{ij}}\)</span> 的分布特征是距离矩阵 <span class="math notranslate nohighlight">\({\bf{D}}\)</span> 信息的完全量化，应用直方图的方法来估计  <span class="math notranslate nohighlight">\({\bf{D}}\)</span>  的经验概率密度函数。设直方图有  <span class="math notranslate nohighlight">\(M\)</span> 个区间，统计所有 <span class="math notranslate nohighlight">\({d_{ij}}\)</span> 落入到每个区间的概率记为  <span class="math notranslate nohighlight">\({p_t},t = 1,2, \cdots ,M\)</span> 。为了减少偏差，不计入  <span class="math notranslate nohighlight">\(i=j\)</span> 的元素。</p></li>
<li><p>分布熵可以被定义为:</p></li>
</ol>
<div class="math notranslate nohighlight">
\[DistEn\left( {m,M,N} \right) =  - \sum\limits_{t = 1}^M {{p_t}{{\log }_2}({p_t})}    \tag{3}\]</div>
<ol class="arabic simple" start="5">
<li><p>归一化处理后分布熵表示为</p></li>
</ol>
<div class="math notranslate nohighlight">
\[DistEn\left( {m,M,N} \right) =  - \frac{1}{{{{\log }_2}(M)}}\sum\limits_{t = 1}^M {{p_t}{{\log }_2}({p_t})}  \tag{4}\]</div>
<div class="admonition note">
<p class="admonition-title">备注</p>
<p>分布熵是由Li等人 <a class="footnote-reference brackets" href="#id9" id="id2">1</a>，提出的，建议的参数选择为：</p>
<ul class="simple">
<li><p>嵌入维度  <span class="math notranslate nohighlight">\(m = 2\)</span>  ,</p></li>
<li><p>区间数  <span class="math notranslate nohighlight">\(M=512\)</span></p></li>
</ul>
</div>
</section>
<section id="id3">
<h2>代码实现<a class="headerlink" href="#id3" title="此标题的永久链接"></a></h2>
<p>这里假设您已经获得本项目的的所有代码，若您此时还未获得有关程序，请移步到  <a class="reference internal" href="../install.html"><span class="doc">安装说明</span></a></p>
<p>模糊熵(Fuzzy entropy)的核心程序为  <code class="docutils literal notranslate"><span class="pre">DEparameter</span></code></p>
<div class="highlight-c++ notranslate"><div class="highlight"><pre><span></span><span class="n">function</span><span class="w"> </span><span class="p">[</span><span class="n">DE</span><span class="p">]</span><span class="o">=</span><span class="n">DEparameter</span><span class="p">(</span><span class="n">data</span><span class="p">,</span><span class="n">m</span><span class="p">,</span><span class="n">tau</span><span class="p">,</span><span class="n">sigma</span><span class="p">)</span><span class="w">  </span><span class="o">%</span><span class="w"> </span><span class="n">输入的时间序列为列向量即可</span><span class="w"></span>
<span class="w">     </span><span class="p">[</span><span class="n">DE</span><span class="p">]</span><span class="o">=</span><span class="n">diversityEn</span><span class="p">(</span><span class="n">data</span><span class="p">,</span><span class="n">m</span><span class="p">,</span><span class="n">tau</span><span class="p">,</span><span class="n">sigma</span><span class="p">);</span><span class="w">  </span><span class="o">%</span><span class="w"> </span><span class="n">加入尺度后的矩阵</span><span class="w"> </span><span class="n">再嵌入m维度</span><span class="p">,</span><span class="n">按步骤求出散度熵</span><span class="w"></span>
<span class="n">end</span><span class="w"></span>
</pre></div>
</div>
<div class="admonition important">
<p class="admonition-title">重要</p>
<p>各输入参数的信息如下：</p>
<ul class="simple">
<li><p><code class="docutils literal notranslate"><span class="pre">data</span></code>：输入的时间序列，为列向量</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">m</span></code> :嵌入维度</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">tau</span></code> :像空间重构时步长</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">sigma</span></code> :将[-1,1]区间划分的数量</p></li>
</ul>
</div>
</section>
<section id="id4">
<h2>仿真验证<a class="headerlink" href="#id4" title="此标题的永久链接"></a></h2>
<section id="id5">
<h3>分布熵的脉冲检测结果<a class="headerlink" href="#id5" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="分布熵的脉冲检测结果" src="/assets/DistEn.png" />
</figure>
</section>
<section id="id6">
<h3>多尺度分布熵的故障分类可视化结果<a class="headerlink" href="#id6" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="多尺度分布熵的故障分类可视化结果" src="/assets/MultiDistEn.png" />
</figure>
</section>
<section id="id7">
<h3>抗噪性分析<a class="headerlink" href="#id7" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="抗噪性分析" src="/assets/DistEn1.png" />
</figure>
</section>
<section id="id8">
<h3>计算效率结果<a class="headerlink" href="#id8" title="此标题的永久链接"></a></h3>
<figure class="align-center">
<img alt="计算效率结果" src="/assets/DistEn2.png" />
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
